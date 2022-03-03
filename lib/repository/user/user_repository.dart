import '../../models/user/usuario_actual.dart';

abstract class UserRepository {
  Future<UsuarioActualResponse> me();
}
