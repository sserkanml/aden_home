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
    LowStockRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const LowStockView(),
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddNoteRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const AddNoteView(),
        transitionsBuilder: bottomtotop,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddTagRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const AddTagView(),
        transitionsBuilder: bottomtotop,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SetPasswordRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SetPasswordView(),
        transitionsBuilder: bottomtotop,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MoveSummaryRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const MoveSummaryView(),
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CustomFieldRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CustomFieldView(),
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserProfileRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const UserProfileView(),
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateFolderRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CreateFolderView(),
        fullscreenDialog: true,
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateItemsRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CreateItemsView(),
        fullscreenDialog: true,
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CompanyDetailRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CompanyDetailView(),
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ReportsRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ReportsView(),
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ActivityHistoryRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ActivityHistoryView(),
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BulkImportRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const BulkImportView(),
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TransactionReportRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const TransactionReportView(),
        fullscreenDialog: true,
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    InventorySummaryRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const InventorySummaryView(),
        fullscreenDialog: true,
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    QtyChangesRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const QtyChangesView(),
        fullscreenDialog: true,
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
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
    ErrorRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ErrorView(),
      );
    },
    DashboardWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DashboardWrapperView(),
        fullscreenDialog: true,
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
    SettingsWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsWrapperView(),
      );
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DashboardView(key: args.key),
      );
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsView(),
      );
    },
    SettingsInsideRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SettingsInsideView(),
        fullscreenDialog: true,
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ManageTagRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ManageTagView(),
        fullscreenDialog: true,
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SyncInventroyRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SyncInventroyView(),
        fullscreenDialog: true,
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PreferencesRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const PreferencesView(),
        fullscreenDialog: true,
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HelpSupportRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HelpSupportView(),
        fullscreenDialog: true,
        transitionsBuilder: righttoleftDashboard,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
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
          LowStockRoute.name,
          path: '/lowstock',
        ),
        RouteConfig(
          AddNoteRoute.name,
          path: '/add-note',
        ),
        RouteConfig(
          AddTagRoute.name,
          path: '/add-tag',
        ),
        RouteConfig(
          SetPasswordRoute.name,
          path: '/setPassword',
        ),
        RouteConfig(
          MoveSummaryRoute.name,
          path: '/move-summary',
        ),
        RouteConfig(
          CustomFieldRoute.name,
          path: '/custom-field',
        ),
        RouteConfig(
          UserProfileRoute.name,
          path: '/user-profile',
        ),
        RouteConfig(
          CreateFolderRoute.name,
          path: 'create-folder',
        ),
        RouteConfig(
          CreateItemsRoute.name,
          path: 'create-file',
        ),
        RouteConfig(
          CompanyDetailRoute.name,
          path: '/company-detail',
        ),
        RouteConfig(
          ReportsRoute.name,
          path: '/report',
        ),
        RouteConfig(
          ActivityHistoryRoute.name,
          path: '/activty-history',
        ),
        RouteConfig(
          BulkImportRoute.name,
          path: '/bulk-import',
        ),
        RouteConfig(
          TransactionReportRoute.name,
          path: '/transaction-report',
        ),
        RouteConfig(
          InventorySummaryRoute.name,
          path: '/inventory',
        ),
        RouteConfig(
          QtyChangesRoute.name,
          path: '/qty-changes',
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
              SettingsWrapperRoute.name,
              path: 'settings',
              parent: RootRoute.name,
              children: [
                RouteConfig(
                  SettingsRoute.name,
                  path: '',
                  parent: SettingsWrapperRoute.name,
                ),
                RouteConfig(
                  SettingsInsideRoute.name,
                  path: 'settings-inside',
                  parent: SettingsWrapperRoute.name,
                ),
                RouteConfig(
                  ManageTagRoute.name,
                  path: 'manage-tags',
                  parent: SettingsWrapperRoute.name,
                ),
                RouteConfig(
                  SyncInventroyRoute.name,
                  path: 'sync-inventory',
                  parent: SettingsWrapperRoute.name,
                ),
                RouteConfig(
                  PreferencesRoute.name,
                  path: 'preferences',
                  parent: SettingsWrapperRoute.name,
                ),
                RouteConfig(
                  HelpSupportRoute.name,
                  path: 'help-support',
                  parent: SettingsWrapperRoute.name,
                ),
              ],
            ),
          ],
        ),
        RouteConfig(
          ErrorRoute.name,
          path: '*',
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
/// [LowStockView]
class LowStockRoute extends PageRouteInfo<void> {
  const LowStockRoute()
      : super(
          LowStockRoute.name,
          path: '/lowstock',
        );

  static const String name = 'LowStockRoute';
}

/// generated route for
/// [AddNoteView]
class AddNoteRoute extends PageRouteInfo<void> {
  const AddNoteRoute()
      : super(
          AddNoteRoute.name,
          path: '/add-note',
        );

  static const String name = 'AddNoteRoute';
}

/// generated route for
/// [AddTagView]
class AddTagRoute extends PageRouteInfo<void> {
  const AddTagRoute()
      : super(
          AddTagRoute.name,
          path: '/add-tag',
        );

  static const String name = 'AddTagRoute';
}

/// generated route for
/// [SetPasswordView]
class SetPasswordRoute extends PageRouteInfo<void> {
  const SetPasswordRoute()
      : super(
          SetPasswordRoute.name,
          path: '/setPassword',
        );

  static const String name = 'SetPasswordRoute';
}

/// generated route for
/// [MoveSummaryView]
class MoveSummaryRoute extends PageRouteInfo<void> {
  const MoveSummaryRoute()
      : super(
          MoveSummaryRoute.name,
          path: '/move-summary',
        );

  static const String name = 'MoveSummaryRoute';
}

/// generated route for
/// [CustomFieldView]
class CustomFieldRoute extends PageRouteInfo<void> {
  const CustomFieldRoute()
      : super(
          CustomFieldRoute.name,
          path: '/custom-field',
        );

  static const String name = 'CustomFieldRoute';
}

/// generated route for
/// [UserProfileView]
class UserProfileRoute extends PageRouteInfo<void> {
  const UserProfileRoute()
      : super(
          UserProfileRoute.name,
          path: '/user-profile',
        );

  static const String name = 'UserProfileRoute';
}

/// generated route for
/// [CreateFolderView]
class CreateFolderRoute extends PageRouteInfo<void> {
  const CreateFolderRoute()
      : super(
          CreateFolderRoute.name,
          path: 'create-folder',
        );

  static const String name = 'CreateFolderRoute';
}

/// generated route for
/// [CreateItemsView]
class CreateItemsRoute extends PageRouteInfo<void> {
  const CreateItemsRoute()
      : super(
          CreateItemsRoute.name,
          path: 'create-file',
        );

  static const String name = 'CreateItemsRoute';
}

/// generated route for
/// [CompanyDetailView]
class CompanyDetailRoute extends PageRouteInfo<void> {
  const CompanyDetailRoute()
      : super(
          CompanyDetailRoute.name,
          path: '/company-detail',
        );

  static const String name = 'CompanyDetailRoute';
}

/// generated route for
/// [ReportsView]
class ReportsRoute extends PageRouteInfo<void> {
  const ReportsRoute()
      : super(
          ReportsRoute.name,
          path: '/report',
        );

  static const String name = 'ReportsRoute';
}

/// generated route for
/// [ActivityHistoryView]
class ActivityHistoryRoute extends PageRouteInfo<void> {
  const ActivityHistoryRoute()
      : super(
          ActivityHistoryRoute.name,
          path: '/activty-history',
        );

  static const String name = 'ActivityHistoryRoute';
}

/// generated route for
/// [BulkImportView]
class BulkImportRoute extends PageRouteInfo<void> {
  const BulkImportRoute()
      : super(
          BulkImportRoute.name,
          path: '/bulk-import',
        );

  static const String name = 'BulkImportRoute';
}

/// generated route for
/// [TransactionReportView]
class TransactionReportRoute extends PageRouteInfo<void> {
  const TransactionReportRoute()
      : super(
          TransactionReportRoute.name,
          path: '/transaction-report',
        );

  static const String name = 'TransactionReportRoute';
}

/// generated route for
/// [InventorySummaryView]
class InventorySummaryRoute extends PageRouteInfo<void> {
  const InventorySummaryRoute()
      : super(
          InventorySummaryRoute.name,
          path: '/inventory',
        );

  static const String name = 'InventorySummaryRoute';
}

/// generated route for
/// [QtyChangesView]
class QtyChangesRoute extends PageRouteInfo<void> {
  const QtyChangesRoute()
      : super(
          QtyChangesRoute.name,
          path: '/qty-changes',
        );

  static const String name = 'QtyChangesRoute';
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
/// [ErrorView]
class ErrorRoute extends PageRouteInfo<void> {
  const ErrorRoute()
      : super(
          ErrorRoute.name,
          path: '*',
        );

  static const String name = 'ErrorRoute';
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
/// [SettingsWrapperView]
class SettingsWrapperRoute extends PageRouteInfo<void> {
  const SettingsWrapperRoute({List<PageRouteInfo>? children})
      : super(
          SettingsWrapperRoute.name,
          path: 'settings',
          initialChildren: children,
        );

  static const String name = 'SettingsWrapperRoute';
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({Key? key})
      : super(
          DashboardRoute.name,
          path: 'dashboard',
          args: DashboardRouteArgs(key: key),
        );

  static const String name = 'DashboardRoute';
}

class DashboardRouteArgs {
  const DashboardRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [SettingsInsideView]
class SettingsInsideRoute extends PageRouteInfo<void> {
  const SettingsInsideRoute()
      : super(
          SettingsInsideRoute.name,
          path: 'settings-inside',
        );

  static const String name = 'SettingsInsideRoute';
}

/// generated route for
/// [ManageTagView]
class ManageTagRoute extends PageRouteInfo<void> {
  const ManageTagRoute()
      : super(
          ManageTagRoute.name,
          path: 'manage-tags',
        );

  static const String name = 'ManageTagRoute';
}

/// generated route for
/// [SyncInventroyView]
class SyncInventroyRoute extends PageRouteInfo<void> {
  const SyncInventroyRoute()
      : super(
          SyncInventroyRoute.name,
          path: 'sync-inventory',
        );

  static const String name = 'SyncInventroyRoute';
}

/// generated route for
/// [PreferencesView]
class PreferencesRoute extends PageRouteInfo<void> {
  const PreferencesRoute()
      : super(
          PreferencesRoute.name,
          path: 'preferences',
        );

  static const String name = 'PreferencesRoute';
}

/// generated route for
/// [HelpSupportView]
class HelpSupportRoute extends PageRouteInfo<void> {
  const HelpSupportRoute()
      : super(
          HelpSupportRoute.name,
          path: 'help-support',
        );

  static const String name = 'HelpSupportRoute';
}
