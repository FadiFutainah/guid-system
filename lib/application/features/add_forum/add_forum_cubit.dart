import 'package:app/domain/repositories/forum_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_forum_state.dart';

class AddForumCubit extends Cubit<AddForumState> {
  AddForumCubit() : super(InitialState(false));

  Map<String, dynamic> forumData = {'isQuestion': false};

  void fieldChanged(String key, String value) {
    forumData[key] = value;
  }

  void toggleCheckbox(bool value) {
    forumData['isQuestion'] = value;
    emit(InitialState(value));
  }

  Future<void> submit() async {
    emit(Loading());
    var response = await ForumRepository().addForum(forumData);
    if (response.hasError) {
      emit(Failed());
      return;
    }
    emit(Success());
  }
}
