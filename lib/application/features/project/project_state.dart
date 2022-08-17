part of 'project_cubit.dart';

abstract class AddProjectState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddProjectInitial extends AddProjectState {}

class Loading extends AddProjectState {}

class Success extends AddProjectState {}

class Failed extends AddProjectState {}
