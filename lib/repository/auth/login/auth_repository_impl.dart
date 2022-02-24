import 'dart:convert';
import 'package:http/http.dart';
import 'package:miarma_app/repository/auth/login/auth_repository.dart';

import '../../../models/login/login_dto.dart';
import '../../../models/login/login_response.dart';
import '../../constants.dart';

class AuthRepositoryImpl extends AuthRepository {
  final Client _client = Client();

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    final response =
        await _client.post(Uri.parse("${Constants.baseUrl}/auth/login"),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(loginDto.toJson()));
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to login');
    }
  }
}
