import 'package:app/data/entities/page_dto.dart';
import 'package:app/domain/repositories/roadmap_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'roadmap_state.dart';

class RoadmapCubit extends Cubit<RoadmapState> {
  RoadmapCubit(int id) : super(Loading()) {
    getPage(id);
  }

  Future<void> getPage(id) async {
    emit(Loading());

    var page = await RoadmapRepository().getPage(id);

    if (page.hasError) {
      emit(Failed());
      return;
    }

    emit(Success(page.data));
  }
}
