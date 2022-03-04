import '../../models/posts/post_response.dart';
import '../../models/user/usuario_actual.dart';

abstract class UserRepository {
  Future<UsuarioActualResponse> me();
  Future<List<Post>> userPosts();
}
