import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/domain/repositories/user_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserRepository _userRepository = UserRepository();

  AuthCubit() : super(Uninitialized()) {
    startApp();
  }

  Future<void> startApp() async {
    emit(Loading());
    final bool hasToken = await _userRepository.hasValidToken();

    if (hasToken) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }
}
