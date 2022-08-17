part of 'add_forum_cubit.dart';

abstract class AddForumState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends AddForumState {
  final bool isQuestion;

  InitialState(this.isQuestion);

  @override
  List<Object?> get props => [isQuestion];
}

class Loading extends AddForumState {}

class Failed extends AddForumState {}

class Success extends AddForumState {}
