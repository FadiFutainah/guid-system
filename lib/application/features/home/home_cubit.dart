import 'package:app/application/utils/config/config.dart';
import 'package:app/domain/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial(homePages[0].title));

  void pageChanged(int index) {
    emit(HomeInitial(homePages[index].title));
  }

  Future<void> logout() async {
    var response = await UserRepository().logout();
    if (response.hasError) {
      return;
    }
    emit(LogoutSuccess());
  }
}
