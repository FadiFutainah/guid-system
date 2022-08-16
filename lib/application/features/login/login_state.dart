part of 'login_cubit.dart';

class LoginState extends Equatable {
  final Username username;
  final Password password;
  final FormzStatus status;
  final bool isVisible;

  const LoginState({
    this.isVisible = false,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  LoginState copyWith({
    bool? isVisible,
    Username? username,
    Password? password,
    FormzStatus? status,
  }) =>
      LoginState(
        isVisible: isVisible ?? this.isVisible,
        username: username ?? this.username,
        password: password ?? this.password,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [username, password, status, isVisible];
}

class Loading extends LoginState {
  @override
  List<Object?> get props => [];
}

class Failed extends LoginState {
  final String message;

  const Failed(this.message);

  @override
  List<Object?> get props => [message];
}

class Success extends LoginState {
  @override
  List<Object?> get props => [];
}
