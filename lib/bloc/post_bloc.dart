import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:miarma_app/bloc/post_event.dart';
import 'package:miarma_app/bloc/post_state.dart';

import '../repository/PostRepository/post_repository.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository postRepository;

  PostsBloc(this.postRepository) : super(PostsInitial()) {
    on<FetchPostWithType>(_postsFetched);
  }

  void _postsFetched(FetchPostWithType event, Emitter<PostsState> emit) async {
    try {
      final posts = await postRepository.fetchPosts(event.type);
      emit(PostsFetched(posts, event.type));
      return;
    } on Exception catch (e) {
      emit(PostsFetchError(e.toString()));
    }
  }
}
