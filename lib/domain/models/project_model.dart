import 'package:app/domain/models/profile_tool_model.dart';

import 'member_model.dart';
import 'project_feature_model.dart';

class ProjectModel {
  String name;
  String position;
  String photo;
  String startDate;
  String endDate;
  String description;
  String link;
  bool isCertified;
  List<MemberModel> members;
  List<ProjectFeatureModel> features;
  List<ProfileToolModel> tools;
  ProjectModel({
    required this.name,
    required this.position,
    required this.photo,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.link,
    required this.isCertified,
    required this.members,
    required this.features,
    required this.tools,
  });
}
