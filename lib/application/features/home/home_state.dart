part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  final String title;

  HomeInitial(this.title);
  @override
  List<Object?> get props => [title];
}

class LogoutSuccess extends HomeState {}

class LogoutFailed extends HomeState {}
