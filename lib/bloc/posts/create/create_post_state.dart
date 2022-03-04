part of 'create_post_bloc.dart';

abstract class CreatePostState extends Equatable {
  const CreatePostState();

  @override
  List<Object> get props => [];
}

class CreatePostInitialState extends CreatePostState {}

class CreatePostSuccessState extends CreatePostState {
  final Post post;

  const CreatePostSuccessState(this.post);

  @override
  List<Object> get props => [post];
}

class CreatePostErrorState extends CreatePostState {
  final String message;

  const CreatePostErrorState(this.message);

  @override
  List<Object> get props => [message];
}
