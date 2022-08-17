import 'package:app/domain/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:app/application/features/profile/profile_cubit.dart';
import 'package:app/application/features/profile/view/widgets/project_expansion_tile.dart';
import 'package:app/application/features/profile/view/widgets/project_title.dart';
import 'package:app/domain/models/member_model.dart';
import 'package:app/domain/models/profile_tool_model.dart';
import 'package:app/domain/models/project_feature_model.dart';
import 'package:app/domain/models/project_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_container.dart';
import 'app_text_button.dart';
import 'project_feature_widget.dart';
import 'project_tool_widget.dart';
import 'space.dart';
import 'user_profile_tile.dart';

class ProjectDetailContainer extends StatelessWidget {
  final ProjectModel project;
  final ProfileModel profile;

  const ProjectDetailContainer(
      {Key? key, required this.project, required this.profile})
      : super(key: key);

  List<Widget> _buildUserProfileTiles(List<MemberModel> members) {
    return members.map((e) => UserProfileTile(member: e)).toList();
  }

  List<Widget> _buildProjectFeatureWidget(List<ProjectFeatureModel> features) {
    return features.map((e) => ProjectFeatureWidget(feature: e)).toList();
  }

  List<Widget> _buildProjectToolWidget(List<ProfileToolModel> tools) {
    return tools.map((e) => ProjectToolWidget(tool: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProjectTitle(
            title: project.name,
            isCertified: project.isCertified,
          ),
          const Divider(thickness: 1),
          Column(
            children: [
              ProjectExpansionTile(
                icon: CupertinoIcons.person_3_fill,
                text: 'MEMBERS',
                children: _buildUserProfileTiles(
                  project.members,
                ),
              ),
              ProjectExpansionTile(
                icon: FontAwesomeIcons.listUl,
                text: 'FEATURES',
                children: _buildProjectFeatureWidget(
                  project.features,
                ),
              ),
              ProjectExpansionTile(
                icon: FontAwesomeIcons.fileCode,
                text: 'TOOLS',
                children: _buildProjectToolWidget(project.tools),
              ),
            ],
          ),
          const Space(),
          AppTextButton(
            text: 'back to projects',
            onPressed: () {
              context.read<ProfileCubit>().viewProjects(profile);
            },
          ),
          const Space(),
        ],
      ),
    );
  }
}
