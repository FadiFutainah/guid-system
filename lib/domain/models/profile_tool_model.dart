import 'package:app/domain/models/profile_feature_model.dart';

class ProfileToolModel {
  String title;
  List<ProfileFeatureModel> features;
  ProfileToolModel({
    required this.title,
    required this.features,
  });
}
