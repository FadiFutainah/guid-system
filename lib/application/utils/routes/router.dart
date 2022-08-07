import 'package:app/application/features/authentication/view/splash_page.dart';
import 'package:app/application/features/home/view/home_page.dart';
import 'package:app/application/features/profile/view/foreign_profile_page.dart';
import 'package:app/application/features/profile/view/my_profile_page.dart';
import 'package:auto_route/annotations.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: HomePage),
    AutoRoute(page: MyProfilePage),
    AutoRoute(page: ForeignProfilePage),
  ],
)
class $AppRouter {}
