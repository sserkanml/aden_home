import 'package:aden/core/route/route_generator.dart';
import 'package:auto_route/auto_route.dart';

class SettingsListItemModel {
  final String label;
  final String image;
  final PageRouteInfo<dynamic> route;

  SettingsListItemModel(
      {required this.label, required this.image, required this.route});
}

List<SettingsListItemModel> settingsListData = [
  SettingsListItemModel(
      image: "user.svg",
      label: "Kullanıcı Profili",
      route: const UserProfileRoute()),
  SettingsListItemModel(
      image: "settings.svg",
      label: "Ayarlar",
      route: const SettingsInsideRoute()),
  SettingsListItemModel(
      image: "briefcase.svg",
      label: "Şirket Detay",
      route: const CompanyDetailRoute()),
  SettingsListItemModel(
      image: "pie_chart.svg", label: "Raporlar", route: const ReportsRoute()),
  SettingsListItemModel(
      image: "history.svg",
      label: "Eylem Geçmişi",
      route: const ActivityHistoryRoute()),
  SettingsListItemModel(
      image: "bulk_import.svg",
      label: "Veri Ekle",
      route: const BulkImportRoute()),
  SettingsListItemModel(
      image: "help_circle.svg",
      label: "Yardım & Destek",
      route: const HelpSupportRoute()),
  SettingsListItemModel(
      image: "log_out.svg",
      label: "Çıkış Yap",
      route: const SettingsRoute()),
];
