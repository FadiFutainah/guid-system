part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

class Loading extends AuthState {}

class LoginFailed extends AuthState {
  final String error;

  LoginFailed(this.error);

  @override
  List<Object> get props => [error];
}

class LogoutFailed extends AuthState {
  final String error;

  LogoutFailed(this.error);

  @override
  List<Object> get props => [error];
}
