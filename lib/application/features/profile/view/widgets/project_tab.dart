import 'package:app/application/features/profile/profile_cubit.dart';
import 'package:app/application/features/profile/view/widgets/project_detail_container.dart';
import 'package:app/application/widgets/error_message_widget.dart';
import 'package:app/domain/models/project_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_list.dart';
import 'space.dart';

class ProjectsTab extends StatelessWidget {
  final List<ProjectModel> projects;
  const ProjectsTab({
    Key? key,
    required this.projects,
  }) : super(key: key);

  bool _projectsBuildWhen(pre, curr) {
    if (pre is! Success || curr is! Success) {
      return true;
    }
    return pre.projectView != curr.projectView;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: _projectsBuildWhen,
      builder: (context, state) {
        if (state is! Success) {
          return const ErrorMessageWidget(text: 'unexpected');
        }
        if (state.projectView) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const Space(),
                ProjectDetailContainer(
                  profile: state.profile,
                  project: state.project!,
                ),
              ],
            ),
          );
        }
        return ProjectsList(profile: state.profile);
      },
    );
  }
}
