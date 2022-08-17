import 'package:app/domain/repositories/forum_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:app/data/entities/forum_dto.dart';
import 'package:equatable/equatable.dart';

part 'all_forums_state.dart';

class AllForumsCubit extends Cubit<AllForumsState> {
  AllForumsCubit() : super(AllFotumsInitial()) {
    getForums();
  }

  Future<void> getForums() async {
    emit(Loading());

    var response = await ForumRepository().getForums();

    if (response.hasError) {
      emit(Failed());
      return;
    }

    emit(Success(response.data));
  }
}
