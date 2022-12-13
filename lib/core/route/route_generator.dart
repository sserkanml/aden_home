import 'package:aden/core/constant/path_constant.dart';
import 'package:aden/core/view/error_view.dart';
import 'package:aden/feature/authentication/view/login_view.dart';
import 'package:aden/feature/authentication/view/signup_view.dart';
import 'package:aden/feature/items/view/items_view.dart';
import 'package:aden/feature/notification/view/notification_view.dart';
import 'package:aden/feature/project/view/add_note_view.dart';
import 'package:aden/feature/project/view/add_tag_view.dart';
import 'package:aden/feature/project/view/create_folder_view.dart';
import 'package:aden/feature/project/view/create_items_view.dart';
import 'package:aden/feature/root/view/dashboard_wrapper_view.dart';
import 'package:aden/feature/root/view/inventory_summary_view.dart';
import 'package:aden/feature/root/view/low_stock_view.dart';
import 'package:aden/feature/root/view/move_summary_view.dart';
import 'package:aden/feature/root/view/qty-changes_view.dart';
import 'package:aden/feature/root/view/transaction_report_view.dart';
import 'package:aden/feature/search/view/search_view.dart';
import 'package:aden/feature/settings/view/activity_history_view.dart';
import 'package:aden/feature/settings/view/bulk_import_view.dart';
import 'package:aden/feature/settings/view/company_detail_view.dart';
import 'package:aden/feature/settings/view/custom_field_view.dart';
import 'package:aden/feature/settings/view/help_support_view.dart';
import 'package:aden/feature/settings/view/manage_tag_view.dart';
import 'package:aden/feature/settings/view/preferences_view.dart';
import 'package:aden/feature/settings/view/reports_view.dart';
import 'package:aden/feature/settings/view/set_password_view.dart';
import 'package:aden/feature/settings/view/settings_inside_view.dart';
import 'package:aden/feature/settings/view/settings_view.dart';
import 'package:aden/feature/settings/view/settings_wrapper_view.dart';
import 'package:aden/feature/settings/view/sync_inventroy_view.dart';
import 'package:aden/feature/settings/view/user_profile_view.dart';
import 'package:aden/feature/start/view/onboard_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../feature/project/model/tags_model.dart';
import '../../feature/root/view/dasboard_view.dart';
import '../../feature/root/view/root_view.dart';
import 'custom_animations.dart';

part 'route_generator.gr.dart';

@MaterialAutoRouter(
  preferRelativeImports: false,
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OnboardView, initial: true, path: PathConstant.onboardPath),
    AutoRoute(
      page: LoginView,
      path: PathConstant.loginPath,
    ),
    CustomRoute(
      transitionsBuilder: righttoleftDashboard,
      page: LowStockView,
      path: "/lowstock",
      reverseDurationInMilliseconds: 0,
      durationInMilliseconds: 500,
    ),
    CustomRoute<String?>(
      transitionsBuilder: bottomtotop,
      page: AddNoteView,
      path: "/add-note",
      reverseDurationInMilliseconds: 0,
      durationInMilliseconds: 500,
    ),
    CustomRoute<List<TagsModel>?>(
      transitionsBuilder: bottomtotop,
      page: AddTagView,
      path: "/add-tag",
      reverseDurationInMilliseconds: 0,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      transitionsBuilder: bottomtotop,
      page: SetPasswordView,
      path: "/setPassword",
      reverseDurationInMilliseconds: 500,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      page: MoveSummaryView,
      transitionsBuilder: righttoleftDashboard,
      path: "/move-summary",
      reverseDurationInMilliseconds: 0,
      durationInMilliseconds: 500,
    ),
     CustomRoute(
      page: CustomFieldView,
      transitionsBuilder: righttoleftDashboard,
      path: "/custom-field",
      reverseDurationInMilliseconds: 0,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      page: UserProfileView,
      transitionsBuilder: righttoleftDashboard,
      path: "/user-profile",
      reverseDurationInMilliseconds: 0,
      durationInMilliseconds: 500,
    ),
      CustomRoute(
          page: CreateFolderView,
          transitionsBuilder: righttoleftDashboard,
          path: "create-folder",
          fullscreenDialog: true,
          reverseDurationInMilliseconds: 0,
          durationInMilliseconds: 500,
        ),
         CustomRoute(
          page: CreateItemsView,
          transitionsBuilder: righttoleftDashboard,
          path: "create-file",
          fullscreenDialog: true,
          reverseDurationInMilliseconds: 0,
          durationInMilliseconds: 500,
        ),
    CustomRoute(
      page: CompanyDetailView,
      transitionsBuilder: righttoleftDashboard,
      path: "/company-detail",
      reverseDurationInMilliseconds: 0,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      page: ReportsView,
      transitionsBuilder: righttoleftDashboard,
      path: "/report",
      reverseDurationInMilliseconds: 0,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      page: ActivityHistoryView,
      transitionsBuilder: righttoleftDashboard,
      path: "/activty-history",
      reverseDurationInMilliseconds: 0,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      page: BulkImportView,
      transitionsBuilder: TransitionsBuilders.slideTop,
      path: "/bulk-import",
      reverseDurationInMilliseconds: 0,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      page: TransactionReportView,
      transitionsBuilder: righttoleftDashboard,
      path: "/transaction-report",
      fullscreenDialog: true,
      reverseDurationInMilliseconds: 0,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      page: InventorySummaryView,
      transitionsBuilder: righttoleftDashboard,
      path: "/inventory",
      fullscreenDialog: true,
      reverseDurationInMilliseconds: 0,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      page: QtyChangesView,
      path: "/qty-changes",
      transitionsBuilder: righttoleftDashboard,
      fullscreenDialog: true,
      reverseDurationInMilliseconds: 0,
      durationInMilliseconds: 500,
    ),
    AutoRoute(page: SignupView, path: PathConstant.signupPath),
    AutoRoute(page: RootView, path: "/root", children: [
      AutoRoute(
          page: DashboardWrapperView,
          fullscreenDialog: true,
          path: "",
          children: [
            AutoRoute(page: DashboardView, path: "dashboard", initial: true),
          ]),
      AutoRoute(page: ItemsView, path: "items"),
      AutoRoute(page: SearchView, path: "search"),
      AutoRoute(page: NotificationView, path: "notification"),
      AutoRoute(page: SettingsWrapperView, path: "settings", children: [
        AutoRoute(page: SettingsView, path: "", initial: true),
        CustomRoute(
          page: SettingsInsideView,
          transitionsBuilder: righttoleftDashboard,
          path: "settings-inside",
          fullscreenDialog: true,
          reverseDurationInMilliseconds: 0,
          durationInMilliseconds: 500,
        ),
        CustomRoute(
          page: ManageTagView,
          transitionsBuilder: righttoleftDashboard,
          path: "manage-tags",
          fullscreenDialog: true,
          reverseDurationInMilliseconds: 0,
          durationInMilliseconds: 500,
        ),
       
        CustomRoute(
          page: SyncInventroyView,
          transitionsBuilder: righttoleftDashboard,
          path: "sync-inventory",
          fullscreenDialog: true,
          reverseDurationInMilliseconds: 0,
          durationInMilliseconds: 500,
        ),
        CustomRoute(
          page: PreferencesView,
          transitionsBuilder: righttoleftDashboard,
          path: "preferences",
          fullscreenDialog: true,
          reverseDurationInMilliseconds: 0,
          durationInMilliseconds: 500,
        ),
        CustomRoute(
          page: HelpSupportView,
          transitionsBuilder: righttoleftDashboard,
          path: "help-support",
          fullscreenDialog: true,
          reverseDurationInMilliseconds: 0,
          durationInMilliseconds: 500,
        ),
      ]),
    ]),
    AutoRoute(path: "*", page: ErrorView)
  ],
)
class RouteGenerator extends _$RouteGenerator {}
