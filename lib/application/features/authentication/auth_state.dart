part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Uninitialized extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

class Loading extends AuthState {}

class Failed extends AuthState {
  final String message;

  Failed(this.message);

  @override
  List<Object?> get props => [message];
}
