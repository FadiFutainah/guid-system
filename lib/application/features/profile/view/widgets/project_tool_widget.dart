import 'package:app/domain/models/profile_feature_model.dart';
import 'package:app/domain/models/profile_tool_model.dart';
import 'package:flutter/material.dart';

import 'profile_tool_feature_widget.dart';
import 'space.dart';

class ProjectToolWidget extends StatelessWidget {
  final ProfileToolModel tool;
  const ProjectToolWidget({
    Key? key,
    required this.tool,
  }) : super(key: key);

  List<ProfileToolFeatureWidget> _buildProfileToolFeatureWidget(
      List<ProfileFeatureModel> features) {
    return features
        .map((e) => ProfileToolFeatureWidget(feature: e, inProject: true))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        tool.title,
        style: Theme.of(context).textTheme.headline2,
      ),
      children: [
        Text(
          'used in features',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        const Space(),
        ..._buildProfileToolFeatureWidget(tool.features),
      ],
    );
  }
}
