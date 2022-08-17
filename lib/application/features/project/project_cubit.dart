import 'package:app/domain/repositories/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'project_state.dart';

class AddProjectCubit extends Cubit<AddProjectState> {
  AddProjectCubit() : super(AddProjectInitial());

  Map<String, dynamic> projectInfo = {};
  Map<String, dynamic> membershipInfo = {};

  void projectFieldChanged(String key, String value) {
    projectInfo[key] = value;
  }

  void membershipFieldChanged(String key, String value) {
    membershipInfo[key] = value;
  }

  Future<void> submit() async {
    emit(Loading());
    membershipInfo['project'] = projectInfo;
    var response = await ProfileRepository().addProject(membershipInfo);
    if (response.hasError) {
      emit(Failed());
      return;
    }
    emit(Success());
  }
}
