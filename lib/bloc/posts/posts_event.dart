part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class FetchPost extends PostsEvent {
  const FetchPost();

  @override
  List<Object> get props => [];
}
