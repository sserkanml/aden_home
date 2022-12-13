import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:aden/core/route/route_managment.dart';
import 'package:aden/core/service/dependecy_injenction.dart';
import 'package:aden/core/service/supabase_service.dart';
import 'package:aden/core/theme/dark_theme.dart';
import 'package:aden/core/theme/light_theme.dart';
import 'package:aden/feature/project/model/tags_mobx.dart';
import 'package:aden/feature/project/model/tags_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import 'feature/project/view_model/images_picker.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  DependecyService.getIt.registerSingleton<SupabaseService>(SupabaseService());
  DependecyService.getIt.registerSingleton<TagsMobx>(TagsMobx());
 
  DependecyService.getIt.get<TagsMobx>().models =
      await TagsService.getAllTags();
  DependecyService.getIt.get<TagsMobx>().copyModels = DependecyService.getIt
      .get<TagsMobx>()
      .models
      .map<TagsModel>((e) => TagsModel(tags_id: e.tags_id, name: e.name).copyWith())
      .toList();

  runApp(MyApp(savedMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    this.savedMode,
  }) : super(key: key);
  final AdaptiveThemeMode? savedMode;
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: LightTheme.instance!.theme.copyWith(
            textTheme: GoogleFonts.poppinsTextTheme(context.textTheme)),
        dark: DarkTheme.instance!.theme.copyWith(
            textTheme: GoogleFonts.poppinsTextTheme(context.textTheme)),
        initial: savedMode ?? AdaptiveThemeMode.light,
        builder: (light, dark) {
          return MaterialApp.router(
            title: 'Envanterus',
            theme: light,
            darkTheme: dark,
            debugShowCheckedModeBanner: false,
            routerDelegate: RouteManagment.router.delegate(),
            routeInformationParser: RouteManagment.router.defaultRouteParser(),
          );
        });
  }
}
