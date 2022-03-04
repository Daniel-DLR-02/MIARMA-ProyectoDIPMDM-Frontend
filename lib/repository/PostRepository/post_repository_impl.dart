import 'dart:convert';
import 'package:http/http.dart';
import 'package:miarma_app/models/posts/post_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/posts/post_response.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;
import 'post_repository.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

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

  @override
  Future<Post> createPost(PostDto postDto, String filePath) async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    try {
      Map<String, String> headers = {
        "Content-Type": "multipart/form-data",
        "Authorization": "Bearer " + token!
      };

      var data = json.encode({
        "titulo": postDto.titulo,
        "texto": postDto.texto,
        "publica": postDto.publica,
      });

      var request =
          http.MultipartRequest('POST', Uri.parse("${Constants.baseUrl}/post/"))
            ..files.add(http.MultipartFile.fromString('post', data,
                contentType: MediaType('application', 'json')))
            ..files.add(await http.MultipartFile.fromPath('file', filePath));

      request.headers.addAll(headers);

      var response = await request.send();

      if (response.statusCode == 201) {
        return Post.fromJson(jsonDecode(await response.stream.bytesToString()));
      } else {
        throw Exception('Fail to create post');
      }
    } catch (error) {
      print('Error add project $error');
      throw (error);
    }
  }
}
