part of 'create_post_bloc.dart';

abstract class CreatePostEvent extends Equatable {
  const CreatePostEvent();

  @override
  List<Object> get props => [];
}

class DoPostEvent extends CreatePostEvent {
  final PostDto postDto;
  final String filePath;

  const DoPostEvent(this.postDto, this.filePath);
}
