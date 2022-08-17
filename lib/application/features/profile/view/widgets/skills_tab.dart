import 'package:app/application/features/profile/profile_cubit.dart';
import 'package:app/application/widgets/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'experience_widget.dart';
import 'mark_widget.dart';
import 'profile_tool_widget.dart';
import 'skill_container.dart';

class SkillsTab extends StatelessWidget {
  const SkillsTab({Key? key}) : super(key: key);

  bool _experiencesBuildWhen(ProfileState previous, ProfileState current) {
    if (previous is! Success || current is! Success) {
      return false;
    }
    return current.experiencesExpanded != previous.experiencesExpanded;
  }

  bool _toolsBuildWhen(ProfileState previous, ProfileState current) {
    if (previous is! Success || current is! Success) {
      return false;
    }
    return current.toolsExpanded != previous.toolsExpanded;
  }

  bool _marksBuildWhen(ProfileState previous, ProfileState current) {
    if (previous is! Success || current is! Success) {
      return false;
    }
    return current.marksExpanded != previous.marksExpanded;
  }

  Widget _buildServices(BuildContext context, String services) {
    if (services == '') {
      return const ErrorMessageWidget(text: 'nothing added yet');
    }
    return Column(
      children: [
        Text(
          services,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }

  Widget _buildPreferences(BuildContext context, String preferences) {
    if (preferences == '') {
      return const ErrorMessageWidget(text: 'nothing added yet');
    }
    return Column(
      children: [
        Text(
          preferences,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: _experiencesBuildWhen,
            builder: (context, state) {
              if (state is! Success) {
                return Container();
              }
              return SkillContainer(
                title: 'Experiences',
                icon: FontAwesomeIcons.code,
                isExpanded: state.experiencesExpanded,
                expandable: state.profile.experiences.isNotEmpty,
                expandFunction: () {
                  context.read<ProfileCubit>().toggleExperienceExpantion(
                        state.profile,
                        !state.experiencesExpanded,
                      );
                },
                child: ExperienceWidget(
                  experiences: state.profile.experiences,
                  isExpanded: state.experiencesExpanded,
                ),
              );
            },
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: _toolsBuildWhen,
            builder: (context, state) {
              if (state is! Success) {
                return Container();
              }
              return SkillContainer(
                title: 'Tools & Frameworks',
                icon: FontAwesomeIcons.toolbox,
                isExpanded: state.toolsExpanded,
                expandable: state.profile.profileTools.isNotEmpty,
                expandFunction: () {
                  context.read<ProfileCubit>().toggleToolsExpantion(
                        state.profile,
                        !state.toolsExpanded,
                      );
                },
                child: ProfileToolWidget(
                  tools: state.profile.profileTools,
                  isExpanded: state.toolsExpanded,
                ),
              );
            },
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: _marksBuildWhen,
            builder: (context, state) {
              if (state is! Success) {
                return Container();
              }
              return SkillContainer(
                title: 'Marks',
                icon: Icons.school,
                isExpanded: state.marksExpanded,
                expandable: state.profile.marks.isNotEmpty,
                expandFunction: () {
                  context.read<ProfileCubit>().toggleMarksExpantion(
                        state.profile,
                        !state.marksExpanded,
                      );
                },
                child: MarkWidget(
                  marks: state.profile.marks,
                  isExpanded: state.marksExpanded,
                ),
              );
            },
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) => false,
            builder: (context, state) {
              if (state is! Success) {
                return Container();
              }
              return SkillContainer(
                title: 'Services',
                icon: FontAwesomeIcons.circleInfo,
                expandFunction: () {},
                expandable: false,
                isExpanded: false,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      _buildServices(context, state.profile.aboutme.services),
                ),
              );
            },
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) => false,
            builder: (context, state) {
              if (state is! Success) {
                return Container();
              }
              return SkillContainer(
                title: 'Preferences',
                icon: Icons.assignment_turned_in_outlined,
                expandFunction: () {},
                expandable: false,
                isExpanded: false,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildPreferences(
                      context, state.profile.aboutme.preferences),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
