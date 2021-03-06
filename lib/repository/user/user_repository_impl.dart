import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:miarma_app/models/posts/post_response.dart';
import 'package:miarma_app/models/user/usuario_actual.dart';
import 'package:miarma_app/repository/constants.dart';
import 'package:miarma_app/repository/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl extends UserRepository {
  final Client _client = Client();

  @override
  Future<UsuarioActualResponse> me() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    final response =
        await _client.get(Uri.parse("${Constants.baseUrl}/me"), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    });
    if (response.statusCode == 200) {
      return UsuarioActualResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to load profile');
    }
  }

  @override
  Future<List<Post>> userPosts() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    final response =
        await _client.get(Uri.parse('${Constants.baseUrl}/post/me'), headers: {
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
