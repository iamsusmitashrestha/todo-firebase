// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/legacy.dart';
import 'package:flutter/material.dart';

import '../../features/home/home_view.dart';
import '../../features/register/register_view.dart';

class Routes {
  static const String registerViewRoute = '/';
  static const String homeViewRoute = '/home-view';
  static const all = <String>{
    registerViewRoute,
    homeViewRoute,
  };
}

class AutoRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.registerViewRoute, page: RegisterView),
    RouteDef(Routes.homeViewRoute, page: HomeView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    RegisterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
  };
}
