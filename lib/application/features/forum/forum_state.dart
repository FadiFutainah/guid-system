import 'package:equatable/equatable.dart';

abstract class ForumState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends ForumState {}

class Loading extends ForumState {}

class Success extends ForumState {}
