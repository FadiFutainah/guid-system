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
import 'package:app/application/features/all_forums/view/all_forums_page.dart'
    as _i11;
import 'package:app/application/features/authentication/view/splash_page.dart'
    as _i1;
import 'package:app/application/features/foreign_profile/view/foreign_profile_page.dart'
    as _i5;
import 'package:app/application/features/forum/view/forum_page.dart' as _i6;
import 'package:app/application/features/home/view/home_page.dart' as _i3;
import 'package:app/application/features/login/view/login_page.dart' as _i2;
import 'package:app/application/features/profile/view/profile_page.dart' as _i4;
import 'package:app/application/features/project/view/add_project_page.dart'
    as _i10;
import 'package:app/application/features/roadmap/view/other_roadmap_page.dart'
    as _i12;
import 'package:app/application/features/roadmap/view/roadmaps_page.dart'
    as _i8;
import 'package:app/application/features/settings/view/settings_page.dart'
    as _i9;
import 'package:app/data/entities/forum_dto.dart' as _i15;
import 'package:app/data/providers/forum_provider.dart' as _i16;
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.HomePage(key: args.key));
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.ProfilePage(key: args.key, id: args.id));
    },
    ForeignProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ForeignProfileRouteArgs>();
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i5.ForeignProfilePage(key: args.key, id: args.id));
    },
    ForumRoute.name: (routeData) {
      final args = routeData.argsAs<ForumRouteArgs>();
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i6.ForumPage(key: args.key, forum: args.forum));
    },
    AddForumRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.AddForumPage());
    },
    RoadmapsRoute.name: (routeData) {
      final args = routeData.argsAs<RoadmapsRouteArgs>();
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i8.RoadmapsPage(key: args.key, id: args.id));
    },
    SettingsRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.SettingsPage());
    },
    AddProjectRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.AddProjectPage());
    },
    AllForumsRoute.name: (routeData) {
      final args = routeData.argsAs<AllForumsRouteArgs>();
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i11.AllForumsPage(
              page: args.page,
              search: args.search,
              ordering: args.ordering,
              isQuestion: args.isQuestion,
              isClosed: args.isClosed,
              isMine: args.isMine,
              tagID: args.tagID,
              key: args.key));
    },
    OtherRoadmapRoute.name: (routeData) {
      final args = routeData.argsAs<OtherRoadmapRouteArgs>();
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i12.OtherRoadmapPage(key: args.key, id: args.id));
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(SplashRoute.name, path: '/'),
        _i13.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i13.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i13.RouteConfig(ProfileRoute.name, path: '/profile-page'),
        _i13.RouteConfig(ForeignProfileRoute.name,
            path: '/foreign-profile-page'),
        _i13.RouteConfig(ForumRoute.name, path: '/forum-page'),
        _i13.RouteConfig(AddForumRoute.name, path: '/add-forum-page'),
        _i13.RouteConfig(RoadmapsRoute.name, path: '/roadmaps-page'),
        _i13.RouteConfig(SettingsRoute.name, path: '/settings-page'),
        _i13.RouteConfig(AddProjectRoute.name, path: '/add-project-page'),
        _i13.RouteConfig(AllForumsRoute.name, path: '/all-forums-page'),
        _i13.RouteConfig(OtherRoadmapRoute.name, path: '/other-roadmap-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i13.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i14.Key? key})
      : super(HomeRoute.name,
            path: '/home-page', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({_i14.Key? key, int? id})
      : super(ProfileRoute.name,
            path: '/profile-page', args: ProfileRouteArgs(key: key, id: id));

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key, this.id});

  final _i14.Key? key;

  final int? id;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i5.ForeignProfilePage]
class ForeignProfileRoute extends _i13.PageRouteInfo<ForeignProfileRouteArgs> {
  ForeignProfileRoute({_i14.Key? key, required int id})
      : super(ForeignProfileRoute.name,
            path: '/foreign-profile-page',
            args: ForeignProfileRouteArgs(key: key, id: id));

  static const String name = 'ForeignProfileRoute';
}

class ForeignProfileRouteArgs {
  const ForeignProfileRouteArgs({this.key, required this.id});

  final _i14.Key? key;

  final int id;

  @override
  String toString() {
    return 'ForeignProfileRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.ForumPage]
class ForumRoute extends _i13.PageRouteInfo<ForumRouteArgs> {
  ForumRoute({_i14.Key? key, required _i15.ForumDto forum})
      : super(ForumRoute.name,
            path: '/forum-page', args: ForumRouteArgs(key: key, forum: forum));

  static const String name = 'ForumRoute';
}

class ForumRouteArgs {
  const ForumRouteArgs({this.key, required this.forum});

  final _i14.Key? key;

  final _i15.ForumDto forum;

  @override
  String toString() {
    return 'ForumRouteArgs{key: $key, forum: $forum}';
  }
}

/// generated route for
/// [_i7.AddForumPage]
class AddForumRoute extends _i13.PageRouteInfo<void> {
  const AddForumRoute() : super(AddForumRoute.name, path: '/add-forum-page');

  static const String name = 'AddForumRoute';
}

/// generated route for
/// [_i8.RoadmapsPage]
class RoadmapsRoute extends _i13.PageRouteInfo<RoadmapsRouteArgs> {
  RoadmapsRoute({_i14.Key? key, required int id})
      : super(RoadmapsRoute.name,
            path: '/roadmaps-page', args: RoadmapsRouteArgs(key: key, id: id));

  static const String name = 'RoadmapsRoute';
}

class RoadmapsRouteArgs {
  const RoadmapsRouteArgs({this.key, required this.id});

  final _i14.Key? key;

  final int id;

  @override
  String toString() {
    return 'RoadmapsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i9.SettingsPage]
class SettingsRoute extends _i13.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i10.AddProjectPage]
class AddProjectRoute extends _i13.PageRouteInfo<void> {
  const AddProjectRoute()
      : super(AddProjectRoute.name, path: '/add-project-page');

  static const String name = 'AddProjectRoute';
}

/// generated route for
/// [_i11.AllForumsPage]
class AllForumsRoute extends _i13.PageRouteInfo<AllForumsRouteArgs> {
  AllForumsRoute(
      {required int page,
      required String search,
      required _i16.Ordering ordering,
      bool? isQuestion,
      bool? isClosed,
      bool? isMine,
      int? tagID,
      _i14.Key? key})
      : super(AllForumsRoute.name,
            path: '/all-forums-page',
            args: AllForumsRouteArgs(
                page: page,
                search: search,
                ordering: ordering,
                isQuestion: isQuestion,
                isClosed: isClosed,
                isMine: isMine,
                tagID: tagID,
                key: key));

  static const String name = 'AllForumsRoute';
}

class AllForumsRouteArgs {
  const AllForumsRouteArgs(
      {required this.page,
      required this.search,
      required this.ordering,
      this.isQuestion,
      this.isClosed,
      this.isMine,
      this.tagID,
      this.key});

  final int page;

  final String search;

  final _i16.Ordering ordering;

  final bool? isQuestion;

  final bool? isClosed;

  final bool? isMine;

  final int? tagID;

  final _i14.Key? key;

  @override
  String toString() {
    return 'AllForumsRouteArgs{page: $page, search: $search, ordering: $ordering, isQuestion: $isQuestion, isClosed: $isClosed, isMine: $isMine, tagID: $tagID, key: $key}';
  }
}

/// generated route for
/// [_i12.OtherRoadmapPage]
class OtherRoadmapRoute extends _i13.PageRouteInfo<OtherRoadmapRouteArgs> {
  OtherRoadmapRoute({_i14.Key? key, required int id})
      : super(OtherRoadmapRoute.name,
            path: '/other-roadmap-page',
            args: OtherRoadmapRouteArgs(key: key, id: id));

  static const String name = 'OtherRoadmapRoute';
}

class OtherRoadmapRouteArgs {
  const OtherRoadmapRouteArgs({this.key, required this.id});

  final _i14.Key? key;

  final int id;

  @override
  String toString() {
    return 'OtherRoadmapRouteArgs{key: $key, id: $id}';
  }
}
