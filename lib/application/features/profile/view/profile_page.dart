import 'package:app/application/features/profile/profile_cubit.dart';
import 'package:app/application/features/profile/view/widgets/skills_tab.dart';
import 'package:app/application/widgets/error_message_widget.dart';
import 'package:app/application/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/about_tab.dart';
import 'widgets/app_tab_bar.dart';
import 'widgets/profile_card.dart';
import 'widgets/project_tab.dart';

class ProfilePage extends StatelessWidget {
  final int? id;
  const ProfilePage({Key? key, this.id}) : super(key: key);

  bool _profileBuildWhen(ProfileState previous, ProfileState current) {
    if (previous is Success && current is Success) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(id),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: _profileBuildWhen,
        builder: (context, state) {
          if (state is Success) {
            return DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  ProfileCard(
                    card: state.profile.profileCard,
                  ),
                  const AppTabBar(),
                  const SizedBox(height: 10),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ProjectsTab(projects: state.profile.projects),
                        const SkillsTab(),
                        AboutTab(about: state.profile.about),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            );
          }
          if (state is Failed) {
            return ErrorMessageWidget(text: state.message);
          }
          return const LoadingWidget();
        },
      ),
    );
  }
}
