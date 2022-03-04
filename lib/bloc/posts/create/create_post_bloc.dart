import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/posts/post_dto.dart';
import '../../../models/posts/post_response.dart';
import '../../../repository/PostRepository/post_repository.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final PostRepository postRepository;

  CreatePostBloc(this.postRepository) : super(CreatePostInitialState()) {
    on<DoPostEvent>(_doPostEvent);
  }

  void _doPostEvent(DoPostEvent event, Emitter<CreatePostState> emit) async {
    try {
      final postResponse =
          await postRepository.createPost(event.postDto, event.filePath);
      emit(CreatePostSuccessState(postResponse));
      return;
    } on Exception catch (e) {
      emit(CreatePostErrorState(e.toString()));
    }
  }
}
