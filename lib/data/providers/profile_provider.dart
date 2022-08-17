import 'package:app/application/utils/config/config.dart';
import 'package:app/data/helpers/restapi_service.dart';
import 'package:app/data/entities/profile_dto.dart';

class ProfileProvider {
  final RestApiService _restApi =
      // ignore: prefer_interpolation_to_compose_strings
      RestApiService(domain + 'api/student-profile/');

  Future<List<ProfileDto>> getProfiles() async {
    try {
      var response = await _restApi.get('profiles');
      return List.from(response.map((e) => ProfileDto.fromMap(e)));
    } catch (e) {
      rethrow;
    }
  }

  Future<ProfileDto> getMyProfile() async {
    try {
      var response = await _restApi.get('profiles/me/', hasToken: true);
      return ProfileDto.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<ProfileDto> getProfile(int id) async {
    try {
      var response = await _restApi.get('profiles/$id/', hasToken: true);
      return ProfileDto.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }

  Future editProfile(int id, Map<String, String> body) async {
    try {
      await _restApi.patch('profiles/$id/', body, hasToken: true);
      return 'data edited successfully';
    } catch (e) {
      rethrow;
    }
  }

  Future editProfilePhoto(int id, String photoPath) async {
    try {
      await _restApi.editProfilePhoto(
        'profiles/$id/',
        photoPath,
        hasToken: true,
      );
      return 'photo edited successfully';
    } catch (e) {
      rethrow;
    }
  }

  Future addMembership(int id, Map<String, dynamic> body) async {
    try {
      await _restApi.addProjectRequest(
        'profiles/$id/memberships/',
        body,
        hasToken: true,
      );
      return 'project added successfully';
    } catch (e) {
      rethrow;
    }
  }
}
