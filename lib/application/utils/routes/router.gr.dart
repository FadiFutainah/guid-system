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
import 'package:app/application/features/profile/view/my_profile_page.dart'
    as _i4;
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.HomePage(key: args.key));
    },
    MyProfileRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.MyProfilePage());
    },
    ForeignProfileRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.ForeignProfilePage());
    },
    ForumRoute.name: (routeData) {
      final args = routeData.argsAs<ForumRouteArgs>(
          orElse: () => const ForumRouteArgs());
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: _i6.ForumPage(key: args.key));
    },
    AddForumRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.AddForumPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashRoute.name, path: '/'),
        _i8.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i8.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i8.RouteConfig(MyProfileRoute.name, path: '/my-profile-page'),
        _i8.RouteConfig(ForeignProfileRoute.name,
            path: '/foreign-profile-page'),
        _i8.RouteConfig(ForumRoute.name, path: '/forum-page'),
        _i8.RouteConfig(AddForumRoute.name, path: '/add-forum-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i9.Key? key})
      : super(HomeRoute.name,
            path: '/home-page', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.MyProfilePage]
class MyProfileRoute extends _i8.PageRouteInfo<void> {
  const MyProfileRoute() : super(MyProfileRoute.name, path: '/my-profile-page');

  static const String name = 'MyProfileRoute';
}

/// generated route for
/// [_i5.ForeignProfilePage]
class ForeignProfileRoute extends _i8.PageRouteInfo<void> {
  const ForeignProfileRoute()
      : super(ForeignProfileRoute.name, path: '/foreign-profile-page');

  static const String name = 'ForeignProfileRoute';
}

/// generated route for
/// [_i6.ForumPage]
class ForumRoute extends _i8.PageRouteInfo<ForumRouteArgs> {
  ForumRoute({_i9.Key? key})
      : super(ForumRoute.name,
            path: '/forum-page', args: ForumRouteArgs(key: key));

  static const String name = 'ForumRoute';
}

class ForumRouteArgs {
  const ForumRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'ForumRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.AddForumPage]
class AddForumRoute extends _i8.PageRouteInfo<void> {
  const AddForumRoute() : super(AddForumRoute.name, path: '/add-forum-page');

  static const String name = 'AddForumRoute';
}
