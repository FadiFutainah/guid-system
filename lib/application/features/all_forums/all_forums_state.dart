import 'package:equatable/equatable.dart';

abstract class AllForumsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends AllForumsState {}

class Loading extends AllForumsState {}

class Success extends AllForumsState {}
