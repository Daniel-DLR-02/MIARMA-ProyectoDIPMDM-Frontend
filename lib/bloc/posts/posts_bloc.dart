import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/retry.dart';
import '../../models/posts/post_response.dart';
import '../../repository/PostRepository/post_repository.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository postRepository;

  PostsBloc(this.postRepository) : super(PostsInitial()) {
    on<FetchPost>(_postsFetched);
  }

  void _postsFetched(FetchPost event, Emitter<PostsState> emit) async {
    try {
      final posts = await postRepository.fetchPosts();
      emit(PostsFetched(posts));
      return;
    } on Exception catch (e) {
      emit(PostFetchError(e.toString()));
    }
  }
}
