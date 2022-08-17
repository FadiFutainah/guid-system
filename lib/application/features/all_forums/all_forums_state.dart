part of 'all_forums_cubit.dart';

abstract class AllForumsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AllFotumsInitial extends AllForumsState {}

class Loading extends AllForumsState {}

class Failed extends AllForumsState {}

class Success extends AllForumsState {
  final List<ForumDto> forums;

  Success(this.forums);

  @override
  List<Object?> get props => [forums];
}
