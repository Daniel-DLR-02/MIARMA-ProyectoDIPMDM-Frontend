import 'package:miarma_app/models/login/login_dto.dart';

import '../../../models/login/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginDto loginDto);
}
