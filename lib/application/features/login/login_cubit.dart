import 'package:app/domain/models/response_model.dart';
import 'package:app/domain/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/domain/models/form_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepository _userRepository = UserRepository();

  final String? username = null;
  final String? password = null;

  LoginCubit() : super(const LoginState());

  IconData getPasswordIcon() {
    return state.isVisible ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye;
  }

  void _passwordEvent(String value) {
    final Password password = Password.dirty(value);
    emit(state.copyWith(
      password: password.valid ? password : Password.pure(password.value),
      status: Formz.validate([state.username, password]),
    ));
  }

  void _usernameEvent(String value) {
    final Username username = Username.dirty(value);

    emit(state.copyWith(
      username: username.valid ? username : Username.pure(username.value),
      status: Formz.validate([username, state.password]),
    ));
  }

  void usernameChanged(String value) {
    _usernameEvent(value);
  }

  void passwordChanged(String value) {
    _passwordEvent(value);
  }

  @Deprecated('')
  void emialUnfocused() {
    _usernameEvent(state.username.value);
  }

  @Deprecated('')
  void passwordUnfocused() {
    _passwordEvent(state.password.value);
  }

  String? getUsernameError() {
    return state.status.isInvalid ? state.username.error : null;
  }

  String? getPasswordError() {
    return state.status.isInvalid ? state.password.error : null;
  }

  void togglePassword() {
    emit(state.copyWith(isVisible: !state.isVisible));
  }

  void submit() {
    if (state.status.isInvalid || state.status.isPure) {
      emit(state.copyWith(
        username: state.username,
        password: state.password,
        status: Formz.validate([state.username, state.password]),
      ));
      return;
    }
    login(state.username.value, state.password.value);
  }

  Future<void> login(String username, String password) async {
    emit(Loading());
    final ResponseModel response = await _userRepository.login(
      username,
      password,
    );

    if (response.hasError) {
      emit(Failed(response.data));
    } else {
      emit(Success());
    }
  }

  Future<void> logout() async {
    emit(Loading());

    final ResponseModel response = await _userRepository.logout();

    if (response.hasError) {
      emit(Failed(response.data));
    } else {
      emit(Success());
    }
  }
}
