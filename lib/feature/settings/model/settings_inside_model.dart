import 'package:aden/core/route/route_generator.dart';
import 'package:auto_route/auto_route.dart';

class PreferencesSettingsModel {
  final String name;
  final String file;
  final PageRouteInfo<dynamic> route;

  PreferencesSettingsModel(
      {required this.name, required this.file, required this.route});
}

List<PreferencesSettingsModel> preferencesSettingsData = [
  PreferencesSettingsModel(
      name: "Tercihler", file: "settings.svg", route: const PreferencesRoute()),
  PreferencesSettingsModel(
      name: "Özel İnputlar",
      file: "field.svg",
      route: const CustomFieldRoute()),
  PreferencesSettingsModel(
      name: "Etiket Yönet", file: "tag.svg", route: const ManageTagRoute()),
  // PreferencesSettingsModel(
  //     name: "Senkronize Envanter",
  //     file: "renewable.svg",
  //     route: const SyncInventroyRoute()),
];
