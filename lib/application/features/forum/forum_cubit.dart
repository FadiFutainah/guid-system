import 'package:app/data/entities/reply_dto.dart';
import 'package:app/domain/repositories/forum_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forum_state.dart';

class ForumCubit extends Cubit<ForumState> {
  ForumCubit(int id) : super(InitialState()) {
    getReplies(id);
  }

  Future<void> getReplies(int id) async {
    emit(Loading());

    var response = await ForumRepository().getReplies(id);

    if (response.hasError) {
      emit(Failed());
      return;
    }

    emit(Success(response.data));
  }
}
