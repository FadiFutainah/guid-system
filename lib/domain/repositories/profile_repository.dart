import 'package:app/data/providers/profile_provider.dart';
import 'package:app/domain/models/profile_model.dart';
import 'package:app/domain/models/response_model.dart';
import 'package:app/domain/repositories/base_reposotory.dart';

class ProfileRepository extends BaseRepository {
  final ProfileProvider _profileProvider = ProfileProvider();

  Future<ResponseModel> getProfiles() async {
    var profiles = await getData(_profileProvider.getProfiles);
    if (!profiles.hasError) {
      profiles.data = List.from(
        profiles.data.map((e) => ProfileModel.fromDto(e)),
      );
    }
    return profiles;
  }

  Future<ResponseModel> getMyProfile() async {
    var profile = await getData(_profileProvider.getMyProfile);
    if (!profile.hasError) {
      profile.data = ProfileModel.fromDto(profile.data);
    }
    return profile;
  }

  Future<ResponseModel> getProfile(int id) async {
    var profile = await getData(_profileProvider.getProfile, id);
    if (!profile.hasError) {
      profile.data = ProfileModel.fromDto(profile.data);
    }
    return profile;
  }
}
