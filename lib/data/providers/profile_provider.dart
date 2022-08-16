import 'package:app/data/helpers/restapi_service.dart';
import 'package:app/data/entities/profile_dto.dart';

class ProfileProvider {
  final RestApiService _restApi =
      RestApiService('http://127.0.0.1:8088/api/student-profile/');

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

  Future editProfile() {
    throw UnimplementedError();
  }
}
