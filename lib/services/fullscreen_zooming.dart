import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'database_helper.dart';

class FullScreenImageView extends StatefulWidget {
  final String imageUrl;

  const FullScreenImageView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _FullScreenImageViewState createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends State<FullScreenImageView> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    checkBookmarkStatus();
  }

  Future<void> checkBookmarkStatus() async {
    final bookmarks = await DatabaseHelper.instance.getBookmarks();
    setState(() {
      isBookmarked = bookmarks.contains(widget.imageUrl);
    });
  }

  Future<void> toggleBookmark() async {
    if (isBookmarked) {
      await DatabaseHelper.instance.removeBookmark(widget.imageUrl);
    } else {
      await DatabaseHelper.instance.addBookmark(widget.imageUrl);
    }
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
            color: Colors.white,
            onPressed: toggleBookmark,
          ),
        ],
      ),
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(widget.imageUrl),
          backgroundDecoration: BoxDecoration(color: Colors.black),
        ),
      ),
    );
  }
}
