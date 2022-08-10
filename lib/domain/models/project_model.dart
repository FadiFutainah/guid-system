import 'package:app/data/entities/profile_dto.dart';

class ProjectModel {
  final int id;
  final String title;
  final String description;
  final String position;
  final String link;
  final bool isCertified;
  final String startDate;
  final String endDate;

  ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.position,
    required this.link,
    required this.isCertified,
    required this.startDate,
    required this.endDate,
  });

  factory ProjectModel.fromDto(ProjectDto dto) => ProjectModel(
        id: dto.id,
        title: dto.title,
        description: dto.description,
        position: dto.position,
        link: dto.link,
        isCertified: dto.isCertified,
        startDate: dto.startDate,
        endDate: dto.endDate,
      );
}
