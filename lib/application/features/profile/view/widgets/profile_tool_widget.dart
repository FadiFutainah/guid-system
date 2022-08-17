import 'package:app/application/widgets/error_message_widget.dart';
import 'package:app/domain/models/profile_feature_model.dart';
import 'package:app/domain/models/profile_tool_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'profile_tool_feature_widget.dart';

class ProfileToolWidget extends StatelessWidget {
  final List<ProfileToolModel> tools;
  final bool isExpanded;

  const ProfileToolWidget({
    Key? key,
    required this.tools,
    required this.isExpanded,
  }) : super(key: key);

  List<ProfileToolFeatureWidget> _buildProfileToolFeatureWidget(
      List<ProfileFeatureModel> features) {
    return features
        .map((e) => ProfileToolFeatureWidget(feature: e, inProject: false))
        .toList();
  }

  Widget _getToolTile(BuildContext context, int index) {
    return ExpansionTile(
      leading: const Icon(FontAwesomeIcons.codepen),
      title: Text(
        tools[index].title,
        style: Theme.of(context).textTheme.headline5,
      ),
      children: _buildProfileToolFeatureWidget(tools[index].features),
    );
  }

  List<Widget> _getToolTiles(BuildContext context, int limit) {
    List<Widget> toolTiles = [];
    if (limit > tools.length) limit = tools.length;
    for (int i = 0; i < limit; ++i) {
      toolTiles.add(_getToolTile(context, i));
    }
    return toolTiles;
  }

  @override
  Widget build(BuildContext context) {
    if (tools.isEmpty) {
      return const ErrorMessageWidget(text: 'no tools added');
    }
    if (isExpanded && tools.length > 2) {
      return Column(
        children: _getToolTiles(context, tools.length),
      );
    }
    return Column(
      children: _getToolTiles(context, 2),
    );
  }
}
