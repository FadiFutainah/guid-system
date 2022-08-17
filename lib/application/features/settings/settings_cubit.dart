import 'package:app/domain/repositories/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial(genderValue: 'M'));

  Map<String, String> editedInfo = {};

  void fieldChanged(String key, String value) {
    editedInfo[key] = value;
  }

  void genderChanged(String value) {
    editedInfo['gender'] = value;
    emit(SettingsInitial(genderValue: value));
  }

  Future<void> submit() async {
    emit(Loading());
    var response = await ProfileRepository().editBasicInfo(editedInfo);
    if (response.hasError) {
      emit(EditFailed());
      return;
    }
    emit(EditSuccess());
  }
}
