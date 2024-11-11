import 'package:flutter/material.dart';
import 'package:githubrepoandgallery/screens/bookmark_screen.dart';
import 'gallery_screens.dart';
import 'repo_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens
  final List<Widget> _screens = [
    RepoScreen(),
    GalleryScreen(),
  ];

  // Update the selected screen
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the selected screen
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RepoScreen()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GalleryScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              // Navigate to BookmarkScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookmarkScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body:Center(child: Text("Home Screen",style: TextStyle(fontSize: 25),),),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Repos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Gallery',
          ),
        ],
      ),
    );
  }
}
