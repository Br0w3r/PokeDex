import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/pages/splash/splash.page.dart';
import 'package:pokedex/core/routes/bindings.dart';
import 'package:pokedex/core/routes/pages.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/core/theme/dark_app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      theme: appTheme,
      darkTheme: darkAppTheme,
      highContrastTheme: appTheme,
      highContrastDarkTheme: darkAppTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialRoute: Routes.splash,
      defaultTransition: Transition.cupertino,
      initialBinding: SplashBinding(),
      getPages: Pages.pages,
      home: const SplashPage(), //LoginPage(),
    );
  }
}
