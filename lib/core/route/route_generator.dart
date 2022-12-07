import 'package:aden/core/constant/path_constant.dart';
import 'package:aden/feature/authentication/view/login_view.dart';
import 'package:aden/feature/authentication/view/signup_view.dart';
import 'package:aden/feature/items/view/items_view.dart';
import 'package:aden/feature/notification/view/notification_view.dart';
import 'package:aden/feature/root/view/dashboard_wrapper_view.dart';
import 'package:aden/feature/search/view/search_view.dart';
import 'package:aden/feature/settings/view/settings_view.dart';
import 'package:aden/feature/start/view/onboard_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../feature/root/view/dasboard_view.dart';
import '../../feature/root/view/root_view.dart';

part 'route_generator.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OnboardView, initial: true, path: PathConstant.onboardPath),
    AutoRoute(
      page: LoginView,
      path: PathConstant.loginPath,
    ),
    AutoRoute(page: SignupView, path: PathConstant.signupPath),
    AutoRoute(page: RootView, path: "/root", children: [
      AutoRoute(page: DashboardWrapperView, path: "", children: [
        AutoRoute(page: DashboardView, path: "dashboard", initial: true)
      ]),
      AutoRoute(page: ItemsView, path: "items"),
      AutoRoute(page: SearchView, path: "search"),
      AutoRoute(page: NotificationView, path: "notification"),
      AutoRoute(page: SettingsView, path: "settings"),
    ])
  ],
)
class RouteGenerator extends _$RouteGenerator {}
