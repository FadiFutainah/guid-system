import 'package:app/application/features/profile/profile_cubit.dart';
import 'package:app/application/widgets/error_message_widget.dart';
import 'package:app/domain/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'project_container.dart';

class ProjectsList extends StatelessWidget {
  final ProfileModel profile;
  const ProjectsList({
    Key? key,
    required this.profile,
  }) : super(key: key);

  Widget _buildProjectList() {
    if (profile.projects.isEmpty) {
      return const ErrorMessageWidget(text: 'no projects added');
    }
    return ListView.builder(
      itemCount: profile.projects.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.read<ProfileCubit>().viewProject(
                  profile,
                  profile.projects[index],
                );
          },
          child: ProjectContainer(project: profile.projects[index]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildProjectList();
  }
}
