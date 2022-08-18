import 'package:app/application/features/add_forum/view/add_forum_page.dart';
import 'package:app/application/features/all_forums/view/all_forums_page.dart';
import 'package:app/application/features/authentication/view/splash_page.dart';
import 'package:app/application/features/forum/view/forum_page.dart';
import 'package:app/application/features/home/view/home_page.dart';
import 'package:app/application/features/login/view/login_page.dart';
import 'package:app/application/features/foreign_profile/view/foreign_profile_page.dart';
import 'package:app/application/features/profile/view/profile_page.dart';
import 'package:app/application/features/project/view/add_project_page.dart';
import 'package:app/application/features/roadmap/view/other_roadmap_page.dart';
import 'package:app/application/features/roadmap/view/roadmaps_page.dart';
import 'package:app/application/features/settings/view/settings_page.dart';
import 'package:auto_route/annotations.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: HomePage),
    AutoRoute(page: ProfilePage),
    AutoRoute(page: ForeignProfilePage),
    AutoRoute(page: ForumPage),
    AutoRoute(page: AddForumPage),
    AutoRoute(page: RoadmapsPage),
    AutoRoute(page: SettingsPage),
    AutoRoute(page: AddProjectPage),
    AutoRoute(page: AllForumsPage),
    AutoRoute(page: OtherRoadmapPage),
  ],
)
class $AppRouter {}
