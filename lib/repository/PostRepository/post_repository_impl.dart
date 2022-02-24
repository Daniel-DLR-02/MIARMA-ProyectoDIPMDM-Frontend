import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/posts/post_response.dart';
import '../constants.dart';
import 'package:http/http.dart';
import 'post_repository.dart';
import 'dart:io';

class PostRepositoryImpl extends PostRepository {
  final Client _client = Client();

  @override
  Future<List<Post>> fetchPosts() async {
    // final response = await _client.get(Uri.parse('$Constants.baseUrl'));
    //String token = await Candidate().getToken();
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    final response = await _client
        .get(Uri.parse('${Constants.baseUrl}/post/public'), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    });
    if (response.statusCode == 200) {
      return PostsResponse.fromJson(json.decode(response.body)).content;
    } else {
      throw Exception('Fail to load posts');
    }
  }
}
