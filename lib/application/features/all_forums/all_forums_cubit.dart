import 'package:app/data/entities/out_tag_dto.dart';
import 'package:app/data/providers/forum_provider.dart';
import 'package:app/domain/repositories/forum_repository.dart';
import 'package:app/domain/repositories/tag_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:app/data/entities/forum_dto.dart';
import 'package:equatable/equatable.dart';

part 'all_forums_state.dart';

class AllForumsCubit extends Cubit<AllForumsState> {
  AllForumsCubit({
    required int page,
    required String search,
    required Ordering ordering,
    bool? isQuestion,
    bool? isClosed,
    bool? isMine,
    int? tagID,
  }) : super(AllFotumsInitial()) {
    getForums(
      page: page,
      search: search,
      ordering: ordering,
      isClosed: isClosed,
      isMine: isMine,
      isQuestion: isQuestion,
    );
  }

  List<OutTagDto> tags = [];

  Future<void> applyFilters({
    required int page,
    required String search,
    required Ordering ordering,
    bool? isQuestion,
    bool? isClosed,
    bool? isMine,
    int? tagID,
  }) async {
    emit(Searching());

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

    emit(Success(response.data, tags));
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

    var forums = await ForumRepository().getForums(
      page: page,
      search: search,
      ordering: ordering,
      isQuestion: isQuestion,
      isClosed: isClosed,
      isMine: isMine,
      tagID: tagID,
    );

    if (forums.hasError) {
      emit(Failed());
      return;
    }
    var tags = await TagRepository().getTags();

    this.tags = tags.data;

    if (tags.hasError) {
      emit(Failed());
      return;
    }

    emit(Success(forums.data, tags.data));
  }
}
