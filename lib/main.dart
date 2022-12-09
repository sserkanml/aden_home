import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:aden/core/route/route_managment.dart';
import 'package:aden/core/service/dependecy_injenction.dart';
import 'package:aden/core/service/supabase_service.dart';
import 'package:aden/core/theme/dark_theme.dart';
import 'package:aden/core/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  DependecyService.getIt.registerSingleton<SupabaseService>(SupabaseService());
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
