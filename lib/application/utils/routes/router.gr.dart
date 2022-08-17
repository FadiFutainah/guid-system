// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app/application/features/add_forum/view/add_forum_page.dart'
    as _i7;
import 'package:app/application/features/authentication/view/splash_page.dart'
    as _i1;
import 'package:app/application/features/foreign_profile/view/foreign_profile_page.dart'
    as _i5;
import 'package:app/application/features/forum/view/forum_page.dart' as _i6;
import 'package:app/application/features/home/view/home_page.dart' as _i3;
import 'package:app/application/features/login/view/login_page.dart' as _i2;
import 'package:app/application/features/profile/view/profile_page.dart' as _i4;
import 'package:app/application/features/project/view/add_project_page.dart'
    as _i9;
import 'package:app/application/features/settings/view/settings_page.dart'
    as _i8;
import 'package:app/data/entities/forum_dto.dart' as _i12;
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.HomePage(key: args.key));
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.ProfilePage(key: args.key, id: args.id));
    },
    ForeignProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ForeignProfileRouteArgs>();
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i5.ForeignProfilePage(key: args.key, id: args.id));
    },
    ForumRoute.name: (routeData) {
      final args = routeData.argsAs<ForumRouteArgs>();
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i6.ForumPage(key: args.key, forum: args.forum));
    },
    AddForumRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.AddForumPage());
    },
    SettingsRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.SettingsPage());
    },
    AddProjectRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.AddProjectPage());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(SplashRoute.name, path: '/'),
        _i10.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i10.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i10.RouteConfig(ProfileRoute.name, path: '/profile-page'),
        _i10.RouteConfig(ForeignProfileRoute.name,
            path: '/foreign-profile-page'),
        _i10.RouteConfig(ForumRoute.name, path: '/forum-page'),
        _i10.RouteConfig(AddForumRoute.name, path: '/add-forum-page'),
        _i10.RouteConfig(SettingsRoute.name, path: '/settings-page'),
        _i10.RouteConfig(AddProjectRoute.name, path: '/add-project-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i10.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i11.Key? key})
      : super(HomeRoute.name,
            path: '/home-page', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({_i11.Key? key, int? id})
      : super(ProfileRoute.name,
            path: '/profile-page', args: ProfileRouteArgs(key: key, id: id));

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key, this.id});

  final _i11.Key? key;

  final int? id;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i5.ForeignProfilePage]
class ForeignProfileRoute extends _i10.PageRouteInfo<ForeignProfileRouteArgs> {
  ForeignProfileRoute({_i11.Key? key, required int id})
      : super(ForeignProfileRoute.name,
            path: '/foreign-profile-page',
            args: ForeignProfileRouteArgs(key: key, id: id));

  static const String name = 'ForeignProfileRoute';
}

class ForeignProfileRouteArgs {
  const ForeignProfileRouteArgs({this.key, required this.id});

  final _i11.Key? key;

  final int id;

  @override
  String toString() {
    return 'ForeignProfileRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.ForumPage]
class ForumRoute extends _i10.PageRouteInfo<ForumRouteArgs> {
  ForumRoute({_i11.Key? key, required _i12.ForumDto forum})
      : super(ForumRoute.name,
            path: '/forum-page', args: ForumRouteArgs(key: key, forum: forum));

  static const String name = 'ForumRoute';
}

class ForumRouteArgs {
  const ForumRouteArgs({this.key, required this.forum});

  final _i11.Key? key;

  final _i12.ForumDto forum;

  @override
  String toString() {
    return 'ForumRouteArgs{key: $key, forum: $forum}';
  }
}

/// generated route for
/// [_i7.AddForumPage]
class AddForumRoute extends _i10.PageRouteInfo<void> {
  const AddForumRoute() : super(AddForumRoute.name, path: '/add-forum-page');

  static const String name = 'AddForumRoute';
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i9.AddProjectPage]
class AddProjectRoute extends _i10.PageRouteInfo<void> {
  const AddProjectRoute()
      : super(AddProjectRoute.name, path: '/add-project-page');

  static const String name = 'AddProjectRoute';
}
