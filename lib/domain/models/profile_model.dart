import 'package:app/data/entities/profile_dto.dart';
import 'package:app/domain/models/project_model.dart';

class ProfileModel {
  String name;
  int points;
  String photo;
  String gender;
  String services;
  String email;
  String age;
  String address;
  String preferences;
  String workPosition;
  String publicLink;
  List<ProjectModel> projects;

  ProfileModel({
    required this.name,
    required this.points,
    required this.photo,
    required this.gender,
    required this.services,
    required this.email,
    required this.age,
    required this.address,
    required this.preferences,
    required this.workPosition,
    required this.publicLink,
    required this.projects,
  });

  factory ProfileModel.fromDto(ProfileDto dto) => ProfileModel(
        name: '${dto.firstName} ${dto.lastName}',
        photo: dto.photo,
        gender: dto.gender,
        points: dto.points,
        services: dto.services,
        age: (DateTime.now().year - DateTime.parse(dto.birthDate).year)
            .toString(),
        email: dto.email,
        address: dto.address,
        preferences: dto.preferences,
        publicLink: dto.publicLink,
        workPosition: dto.isGraduated ? 'Engineer' : 'Student',
        projects: dto.projects.map((e) => ProjectModel.fromDto(e)).toList(),
      );
}
