import 'dart:convert';
import 'package:http/http.dart';
import '../../models/posts/post_response.dart';
import '../constants.dart';
import 'post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final Client _client = Client();

  @override
  Future<List<Post>> fetchPosts(String type) async {
    final response = await _client.get(Uri.parse('$Constants.baseUrl'));
    if (response.statusCode == 200) {
      return PostsResponse.fromJson(json.decode(response.body)).content;
    } else {
      throw Exception('Fail to load movies');
    }
  }
}
