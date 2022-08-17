import 'package:app/application/features/profile/profile_cubit.dart';
import 'package:app/domain/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_container.dart';
import 'app_text_button.dart';
import 'date_range.dart';
import 'project_title.dart';
import 'space.dart';

class ProjectContainer extends StatelessWidget {
  final ProjectModel project;
  const ProjectContainer({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProjectTitle(title: project.name, isCertified: project.isCertified),
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: Text(
              project.position,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const Space(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              project.photo,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.broken_image,
                color: Colors.grey,
                size: 200,
              ),
            ),
          ),
          const Space(),
          DateRange(startDate: project.startDate, endDate: project.endDate),
          const Space(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              project.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const Space(),
          AppTextButton(
            text: project.link,
            onPressed: () {
              BlocProvider.of<ProfileCubit>(context)
                  .goToProjectLink(project.link);
            },
          ),
          const Space(),
        ],
      ),
    );
  }
}
