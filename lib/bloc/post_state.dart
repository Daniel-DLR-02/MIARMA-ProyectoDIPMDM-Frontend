import 'package:equatable/equatable.dart';
import 'package:miarma_app/bloc/post_event.dart';

import '../models/posts/post_response.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsEvent {}

class PostsFetched extends PostsEvent {
  final List<Post> posts;
  final String type;

  const PostsFetched(this.posts, this.type);

  @override
  List<Object> get props => [posts];
}

class PostFetchError extends PostsState {
  final String message;
  const PostFetchError(this.message);

  @override
  List<Object> get props => [message];
}
