import 'package:app/domain/models/about_me_model.dart';
import 'package:app/domain/models/about_model.dart';
import 'package:app/domain/models/experience_model.dart';
import 'package:app/domain/models/mark_model.dart';
import 'package:app/domain/models/profile_card_model.dart';
import 'package:app/domain/models/profile_tool_model.dart';
import 'package:app/domain/models/project_model.dart';

class ProfileModel {
  ProfileCardModel profileCard;
  List<ProjectModel> projects;
  List<ExperienceModel> experiences;
  List<ProfileToolModel> profileTools;
  List<MarkModel> marks;
  AboutMeModel aboutme;
  AboutModel about;
  ProfileModel({
    required this.profileCard,
    required this.projects,
    required this.experiences,
    required this.profileTools,
    required this.marks,
    required this.aboutme,
    required this.about,
  });
}
