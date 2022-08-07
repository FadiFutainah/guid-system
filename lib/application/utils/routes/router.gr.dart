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
import 'package:app/application/features/authentication/view/splash_page.dart'
    as _i1;
import 'package:app/application/features/home/view/home_page.dart' as _i2;
import 'package:app/application/features/profile/view/foreign_profile_page.dart'
    as _i4;
import 'package:app/application/features/profile/view/my_profile_page.dart'
    as _i3;
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    HomeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    MyProfileRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.MyProfilePage());
    },
    ForeignProfileRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.ForeignProfilePage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashRoute.name, path: '/'),
        _i5.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i5.RouteConfig(MyProfileRoute.name, path: '/my-profile-page'),
        _i5.RouteConfig(ForeignProfileRoute.name, path: '/foreign-profile-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.MyProfilePage]
class MyProfileRoute extends _i5.PageRouteInfo<void> {
  const MyProfileRoute() : super(MyProfileRoute.name, path: '/my-profile-page');

  static const String name = 'MyProfileRoute';
}

/// generated route for
/// [_i4.ForeignProfilePage]
class ForeignProfileRoute extends _i5.PageRouteInfo<void> {
  const ForeignProfileRoute()
      : super(ForeignProfileRoute.name, path: '/foreign-profile-page');

  static const String name = 'ForeignProfileRoute';
}
