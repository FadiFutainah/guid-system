import 'package:app/data/entities/feature_dto.dart';
import 'package:app/data/entities/profile_dto.dart';
import 'package:app/data/entities/project_dto.dart';
import 'package:app/data/entities/project_tool_dto.dart';
import 'package:app/data/entities/small_profile_dto.dart';
import 'package:app/data/providers/profile_provider.dart';
import 'package:app/data/services/local_storage.dart';
import 'package:app/domain/models/about_me_model.dart';
import 'package:app/domain/models/about_model.dart';
import 'package:app/domain/models/contact_model.dart';
import 'package:app/domain/models/experience_model.dart';
import 'package:app/domain/models/mark_model.dart';
import 'package:app/domain/models/member_model.dart';
import 'package:app/domain/models/profile_card_model.dart';
import 'package:app/domain/models/profile_feature_model.dart';
import 'package:app/domain/models/profile_model.dart';
import 'package:app/domain/models/profile_tool_model.dart';
import 'package:app/domain/models/project_feature_model.dart';
import 'package:app/domain/models/project_model.dart';
import 'package:app/domain/models/project_tool_model.dart';
import 'package:app/domain/models/response_model.dart';
import 'package:app/domain/repositories/base_reposotory.dart';

class ProfileRepository extends BaseRepository {
  final ProfileProvider _profileProvider = ProfileProvider();

  MemberModel _memberMapper(SmallProfileDto profile, String position) {
    return MemberModel(
      profileId: profile.userId,
      photo: profile.photo,
      position: position,
      username: profile.username,
    );
  }

  ProfileToolModel _profileToolMapper(ProjectToolDto tool) {
    return ProfileToolModel(
      title: tool.title,
      features: List.from(
        tool.toolFeatures.map(
          (toolFeature) => ProfileFeatureModel(
            description: toolFeature.feature.description,
            endDate: toolFeature.feature.endDate,
            projectId: toolFeature.id,
            startDate: toolFeature.feature.startDate,
            title: toolFeature.feature.title,
          ),
        ),
      ),
    );
  }

  ProjectFeatureModel _projectFeatureMapper(FeatureDto feature) {
    return ProjectFeatureModel(
      name: feature.title,
      description: feature.description,
      startDate: feature.startDate,
      endDate: feature.endDate,
      tools: List.from(
        feature.featureTools.map(
          (featureTool) => ProjectToolModel(title: featureTool.tool.title),
        ),
      ),
    );
  }

  ProjectModel _projectModelMapper(ProjectDto project, String position) {
    return ProjectModel(
      isCertified: project.isCertified,
      description: project.description,
      endDate: project.endDate,
      link: project.link,
      name: project.title,
      photo: project.photo,
      position: position,
      members: List.from(
        project.memberships.map(
          (project) => _memberMapper(project.profile, project.position),
        ),
      ),
      startDate: project.startDate,
      tools: List.from(
        project.tools.map(
          (tool) => _profileToolMapper(tool),
        ),
      ),
      features: List.from(
        project.features.map(
          (feature) => _projectFeatureMapper(feature),
        ),
      ),
    );
  }

  ProfileModel _profileMapper(ProfileDto dto) {
    return ProfileModel(
      profileCard: ProfileCardModel(
        photo: dto.photo,
        points: dto.points,
        username: dto.username,
      ),
      projects: List.from(
        dto.memberships.map((membership) =>
            _projectModelMapper(membership.project, membership.position)),
      ),
      about: AboutModel(
        address: dto.address,
        birthDate: dto.birthDate,
        email: dto.email,
        gender: dto.gender,
        graduateDate: dto.graduateDate,
        contacts: List.from(
          dto.contacts.map(
            (contact) => ContactModel(title: contact.type, value: contact.link),
          ),
        ),
      ),
      aboutme: AboutMeModel(
        preferences: dto.preferences,
        services: dto.services,
      ),
      experiences: List.from(
        dto.experiences.map(
          (experience) => ExperienceModel(
              name: experience.name,
              type: experience.type,
              description: experience.description,
              isCertified: experience.isCertified,
              startDate: experience.startDate,
              endDate: experience.endDate),
        ),
      ),
      marks: List.from(
        dto.marks.map(
          (mark) => MarkModel(
              name: mark.subjectName, mark: mark.mark, date: mark.date),
        ),
      ),
      profileTools: List.from(
        dto.tools.map(
          (profileTool) => ProfileToolModel(
            title: profileTool.title,
            features: List.from(
              profileTool.toolFeatures.map(
                (toolFeature) => ProfileFeatureModel(
                  title: toolFeature.feature.title,
                  description: toolFeature.feature.description,
                  projectId: toolFeature.feature.project,
                  startDate: toolFeature.feature.startDate,
                  endDate: toolFeature.feature.endDate,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<ResponseModel> getProfiles() async {
    var profiles = await getData(_profileProvider.getProfiles);
    if (!profiles.hasError) {
      profiles.data = List.from(
        profiles.data.map((e) => _profileMapper(e)),
      );
    }
    return profiles;
  }

  Future<ResponseModel> getMyProfile() async {
    var response = await getData(_profileProvider.getMyProfile);
    if (!response.hasError) {
      ProfileDto dto = response.data;
      LocalStorage().setUserId(dto.userId);
      response.data = _profileMapper(dto);
    }
    return response;
  }

  Future<ResponseModel> getProfile(int id) async {
    var response = await getData(_profileProvider.getProfile, id);
    if (!response.hasError) {
      ProfileDto dto = response.data;
      response.data = _profileMapper(dto);
    }
    return response;
  }

  Future<ResponseModel> editBasicInfo(Map<String, String> info) async {
    try {
      int id = await LocalStorage().userId;
      var response = await _profileProvider.editProfile(id, info);
      return ResponseModel(response, false);
    } catch (e) {
      return ResponseModel(e.toString(), true);
    }
  }

  Future addProject(Map<String, dynamic> project) async {
    try {
      int id = await LocalStorage().userId;

      var response = await _profileProvider.addMembership(id, project);
      return ResponseModel(response, false);
    } catch (e) {
      return ResponseModel(e.toString(), true);
    }
  }

  Future editProfilePhoto(String path) async {
    try {
      int id = await LocalStorage().userId;
      var response = await _profileProvider.editProfilePhoto(id, path);
      return ResponseModel(response, false);
    } catch (e) {
      return ResponseModel(e.toString(), true);
    }
  }
}
