import 'package:app/data/providers/forum_provider.dart';
import 'package:app/domain/repositories/forum_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:app/data/entities/forum_dto.dart';
import 'package:equatable/equatable.dart';

part 'all_forums_state.dart';

class AllForumsCubit extends Cubit<AllForumsState> {
  AllForumsCubit() : super(AllFotumsInitial()) {
    getForums(
      page: 1,
      search: '',
      ordering: Ordering.none,
    );
  }

  Future<void> getForums({
    required int page,
    required String search,
    required Ordering ordering,
    bool? isQuestion,
    bool? isClosed,
    bool? isMine,
    int? tagID,
  }) async {
    emit(Loading());

    var response = await ForumRepository().getForums(
      page: page,
      search: search,
      ordering: ordering,
      isQuestion: isQuestion,
      isClosed: isClosed,
      isMine: isMine,
      tagID: tagID,
    );

    if (response.hasError) {
      emit(Failed());
      return;
    }

    emit(Success(response.data));
  }
}
