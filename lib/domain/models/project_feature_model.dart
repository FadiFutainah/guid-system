import 'project_tool_model.dart';

class ProjectFeatureModel {
  String name;
  String description;
  String startDate;
  String endDate;
  List<ProjectToolModel> tools;
  ProjectFeatureModel({
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.tools,
  });
}
