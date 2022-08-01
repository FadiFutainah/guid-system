part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

class Loading extends AuthState {}

class AuthenticationFailed extends AuthState {
  final String error;

  AuthenticationFailed(this.error);

  @override
  List<Object> get props => [error];
}

class UnAuthenticationFailed extends AuthState {
  final String error;

  UnAuthenticationFailed(this.error);

  @override
  List<Object> get props => [error];
}
