import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_keys.dart';
import '../models/gist_model.dart';
import '../models/image_model.dart';


class ApiService {
  Future<List<Gist>> fetchGists() async {
    final response = await http.get(Uri.parse('https://api.github.com/gists/public'));

    if (response.statusCode == 200) {
      try {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Gist.fromJson(json as Map<String, dynamic>)).toList();
      } catch (e) {
        print("Error parsing JSON data: $e");
        throw Exception('Failed to parse gists data');
      }
    } else {
      throw Exception('Failed to load gists: ${response.statusCode}');
    }
  }
  Future<List<UnsplashImage>> fetchImages() async {
    final response = await http.get(
      Uri.parse('https://api.unsplash.com/photos?client_id=${accessKey}'),
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => UnsplashImage.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
