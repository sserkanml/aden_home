// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'route_generator.dart';

class _$RouteGenerator extends RootStackRouter {
  _$RouteGenerator([GlobalKey<NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    OnboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OnboardView(),
      );
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    SignupRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignupView(),
      );
    },
    RootRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RootView(),
      );
    },
    DashboardWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DashboardWrapperView(),
      );
    },
    ItemsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ItemsView(),
      );
    },
    SearchRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SearchView(),
      );
    },
    NotificationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NotificationView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/onboard',
          fullMatch: true,
        ),
        RouteConfig(
          OnboardRoute.name,
          path: '/onboard',
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        RouteConfig(
          SignupRoute.name,
          path: '/signup',
        ),
        RouteConfig(
          RootRoute.name,
          path: '/root',
          children: [
            RouteConfig(
              DashboardWrapperRoute.name,
              path: '',
              parent: RootRoute.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: DashboardWrapperRoute.name,
                  redirectTo: 'dashboard',
                  fullMatch: true,
                ),
                RouteConfig(
                  DashboardRoute.name,
                  path: 'dashboard',
                  parent: DashboardWrapperRoute.name,
                ),
              ],
            ),
            RouteConfig(
              ItemsRoute.name,
              path: 'items',
              parent: RootRoute.name,
            ),
            RouteConfig(
              SearchRoute.name,
              path: 'search',
              parent: RootRoute.name,
            ),
            RouteConfig(
              NotificationRoute.name,
              path: 'notification',
              parent: RootRoute.name,
            ),
            RouteConfig(
              SettingsRoute.name,
              path: 'settings',
              parent: RootRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [OnboardView]
class OnboardRoute extends PageRouteInfo<void> {
  const OnboardRoute()
      : super(
          OnboardRoute.name,
          path: '/onboard',
        );

  static const String name = 'OnboardRoute';
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [SignupView]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute()
      : super(
          SignupRoute.name,
          path: '/signup',
        );

  static const String name = 'SignupRoute';
}

/// generated route for
/// [RootView]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          path: '/root',
          initialChildren: children,
        );

  static const String name = 'RootRoute';
}

/// generated route for
/// [DashboardWrapperView]
class DashboardWrapperRoute extends PageRouteInfo<void> {
  const DashboardWrapperRoute({List<PageRouteInfo>? children})
      : super(
          DashboardWrapperRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [ItemsView]
class ItemsRoute extends PageRouteInfo<void> {
  const ItemsRoute()
      : super(
          ItemsRoute.name,
          path: 'items',
        );

  static const String name = 'ItemsRoute';
}

/// generated route for
/// [SearchView]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: 'search',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [NotificationView]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute()
      : super(
          NotificationRoute.name,
          path: 'notification',
        );

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: 'dashboard',
        );

  static const String name = 'DashboardRoute';
}
