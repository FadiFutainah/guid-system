import 'package:app/domain/models/profile_model.dart';
import 'package:app/domain/models/project_model.dart';
import 'package:app/domain/repositories/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:url_launcher/url_launcher.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository = ProfileRepository();

  ProfileCubit(int? id) : super(InitialState()) {
    id == null ? _getMyProfile() : _getForeignProfile(id);
  }

  Future<void> _getMyProfile() async {
    emit(Loading());

    var myProfile = await _profileRepository.getMyProfile();

    if (myProfile.hasError) {
      emit(Failed(myProfile.data));
      return;
    }
    emit(Success(myProfile.data, null, false, false, false, false));
  }

  Future<void> _getForeignProfile(int id) async {
    emit(Loading());

    var profile = await _profileRepository.getProfile(id);

    if (profile.hasError) {
      emit(Failed(profile.data));
      return;
    }
    emit(Success(profile.data, null, false, false, false, false));
  }

  Future<void> goToProjectLink(String link) async {
    Uri url = Uri.parse(link);
    launchUrl(url);
  }

  void viewProject(ProfileModel profile, ProjectModel project) {
    emit(Success(profile, project, true, false, false, false));
  }

  void viewProjects(ProfileModel profile) {
    emit(Success(profile, null, false, false, false, false));
  }

  void toggleExperienceExpantion(ProfileModel profile, bool value) {
    emit(Success(profile, null, false, value, false, false));
  }

  void toggleToolsExpantion(ProfileModel profile, bool value) {
    emit(Success(profile, null, false, false, value, false));
  }

  void toggleMarksExpantion(ProfileModel profile, bool value) {
    emit(Success(profile, null, false, false, false, value));
  }
}
