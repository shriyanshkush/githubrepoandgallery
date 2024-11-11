import 'package:flutter/material.dart';

import '../models/gist_model.dart';
import '../screens/files_screen.dart';

class GistCard extends StatelessWidget {
  final String? description;
  final int comments;
  final String createdAt;
  final String updatedAt;
  final GistOwner owner; // Owner model with owner information
  final List<GistFile> files; // List of files

  GistCard({
    required this.description,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.owner,
    required this.files,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _showOwnerInfo(context, owner),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FilesScreen(files: files),
        ),
      ),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description ?? 'No Description',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Comments: $comments'),
                  Text('Created: $createdAt'),
                ],
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerRight,
                child: Text('Updated: $updatedAt'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showOwnerInfo(BuildContext context, GistOwner owner) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Owner Information"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${owner.login}'),
            Text('ID: ${owner.id}'),
            Text('Type: ${owner.type}'),
            Text('Admin: ${owner.siteAdmin ? "Yes" : "No"}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }
}
