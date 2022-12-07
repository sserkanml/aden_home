import 'package:aden/core/constant/path_constant.dart';
import 'package:aden/feature/authentication/view/login_view.dart';
import 'package:aden/feature/authentication/view/signup_view.dart';
import 'package:aden/feature/start/view/onboard_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
  ],
)
class RouteGenerator extends _$RouteGenerator {}
