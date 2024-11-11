
import 'package:flutter/material.dart';

import '../models/gist_model.dart';

class FilesScreen extends StatelessWidget {
  final List<GistFile> files;

  FilesScreen({required this.files});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Files"),
      ),
      body: ListView.builder(
        itemCount: files.length,
        itemBuilder: (context, index) {
          final file = files[index];
          return ListTile(
            title: Text(file.filename!),
            subtitle: Text('Size: ${file.size} bytes | Language: ${file.language ?? "N/A"}'),
            trailing: Icon(Icons.file_present),
          );
        },
      ),
    );
  }
}
