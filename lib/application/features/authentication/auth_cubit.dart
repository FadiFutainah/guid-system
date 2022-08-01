import 'package:app/domain/entities/response_model.dart';
import 'package:app/domain/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserRepository _userRepository = UserRepository();

  AuthCubit() : super(Uninitialized());

  Future<void> startApp() async {
    final bool hasToken = await _userRepository.hasValidToken();

    if (hasToken) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> login(String username, String password) async {
    final ResponseModel response =
        await _userRepository.login(username, password);

    if (response.hasError) {
      emit(LoginFailed(response.data));
    } else {
      emit(Authenticated());
    }
  }

  Future<void> logout() async {
    final ResponseModel response = await _userRepository.logout();

    if (response.hasError) {
      emit(LogoutFailed(response.data));
    } else {
      emit(Unauthenticated());
    }
  }
}
