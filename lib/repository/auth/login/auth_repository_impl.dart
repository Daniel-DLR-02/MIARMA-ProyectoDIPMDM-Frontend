import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:miarma_app/models/register/register_dto.dart';
import 'package:miarma_app/repository/auth/login/auth_repository.dart';
import 'package:http/http.dart' as http;
import '../../../models/login/login_dto.dart';
import '../../../models/login/login_response.dart';
import '../../../models/register/register_response.dart';
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
    if (response.statusCode == 201) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to login');
    }
  }

  @override
  Future<RegisterResponse> register(
      RegisterDto registerDto, String filePath) async {
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
        "content-type": "application/json"
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse("${Constants.baseUrl}/auth/register"));

      request.headers.addAll(headers);
      String data =
          "{'nick': '${registerDto.nick}','nombre': '${registerDto.nombre}'','email': '${registerDto.email}','fechaNacimiento': '${registerDto.fechaNacimiento}','publico': ${registerDto.publico}}";

      //request = jsonToFormData(request, data);
      request.fields['user'] = data;

      if (filePath != '') {
        request.files.add(await http.MultipartFile.fromPath('file', filePath));
      }

      final response =
          await _client.post(Uri.parse("${Constants.baseUrl}/auth/login"),
              headers: {
                'Content-Type': 'application/json',
              },
              body: request);
      //var response = await request.send();

      if (response.statusCode == 201) {
        return RegisterResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Fail to register');
      }
    } catch (error) {
      print('Error add project $error');
      throw (error);
    }
  }

  jsonToFormData(http.MultipartRequest request, Map<String, dynamic> data) {
    for (var key in data.keys) {
      request.fields[key] = data[key].toString();
    }
    return request;
  }
}
