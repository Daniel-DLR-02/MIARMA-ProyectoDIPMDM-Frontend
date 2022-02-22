import 'dart:convert';
import 'package:http/http.dart';
import 'package:miarma_app/models/posts/post_response.dart';
import 'package:miarma_app/repository/PostRepository/post_repository.dart';
import '../constants.dart';

class PostRepositoryImpl extends PostRepository {
  final Client _client = Client();

  @override
  Future<List<Post>> fetchPosts(String type) async {
    final response = await _client.get(Uri.parse('$Constant.baseUrl/posts'));
    if (response.statusCode == 200) {
      return List<Post>.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to load posts');
    }
  }
}
