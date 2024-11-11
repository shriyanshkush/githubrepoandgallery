import 'package:flutter/material.dart';
import 'package:githubrepoandgallery/widegts/git_card.dart';
import '../models/gist_model.dart';
import '../services/api_services.dart';


class RepoScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text('Repos')),
      body: FutureBuilder<List<Gist>>(
        future: apiService.fetchGists(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final gists = snapshot.data!;
            return ListView.builder(
              itemCount: gists.length,
              itemBuilder: (context, index) {
                final gist = gists[index];
                return GestureDetector(
                  onTap: (){},
                    onLongPress: (){},
                    child: GistCard(description: gist.description, comments: gist.comments, createdAt: gist.createdAt, updatedAt: gist.updatedAt,files: gist.files!,owner:gist.owner!));
              },
            );
          }
        },
      ),
    );
  }
}
