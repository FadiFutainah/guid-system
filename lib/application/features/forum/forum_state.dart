part of 'forum_cubit.dart';

abstract class ForumState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends ForumState {}

class Loading extends ForumState {}

class Failed extends ForumState {}

class Success extends ForumState {
  final List<ReplyDto> replies;

  Success(this.replies);

  @override
  List<Object?> get props => [replies];
}
