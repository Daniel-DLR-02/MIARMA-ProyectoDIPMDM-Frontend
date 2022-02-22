import '../../models/posts/post_response.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts(String type);
}
