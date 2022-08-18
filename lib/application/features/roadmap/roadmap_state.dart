part of 'roadmap_cubit.dart';

abstract class RoadmapState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends RoadmapState {}

class Failed extends RoadmapState {}

class Success extends RoadmapState {
  final PageDto page;

  Success(this.page);

  @override
  List<Object?> get props => [page];
}
