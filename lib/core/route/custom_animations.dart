import 'dart:developer';

import 'package:aden/feature/root/view/dasboard_view.dart';
import 'package:aden/feature/settings/view/user_profile_view.dart';
import 'package:flutter/material.dart';

Widget righttoleftDashboard(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return Stack(
    children: [
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 0.0),
          end: const Offset(-1.0, 0.0),
        ).animate(animation),
        child: DashboardView(),
      ),
    ],
  );
}

Widget bottomtotop(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return Stack(
    children: [
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 0.0),
          end: const Offset(0.0, -1.0),
        ).animate(animation),
        child: const UserProfileView(),
      ),
    ],
  );
}
