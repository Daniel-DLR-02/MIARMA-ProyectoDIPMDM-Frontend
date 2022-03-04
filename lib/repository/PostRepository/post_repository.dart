import '../../models/posts/post_dto.dart';
import '../../models/posts/post_response.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts();
  Future<Post> createPost(PostDto postDto, String filePath);
}
