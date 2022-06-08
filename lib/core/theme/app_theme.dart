import 'package:flutter/material.dart';
import 'package:pokedex/app/utilis/colors.utils.dart';

final ThemeData appTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: Colors.red,
  primaryColorLight: Colors.white70,
  primaryColorDark: Colors.black45,
  inputDecorationTheme: const InputDecorationTheme(alignLabelWithHint: true),
  colorScheme: ColorScheme(
      secondary: ColorsUtils.hexToColor('#212121'),
      primary: Colors.black,
      onSecondary: Colors.white,
      error: Colors.red,
      background: Colors.black45,
      brightness: Brightness.light,
      onBackground: Colors.black45,
      onError: Colors.red,
      onPrimary: Colors.black,
      onSurface: Colors.black45,
      surface: Colors.black45),
  indicatorColor: Colors.white,
  backgroundColor: Colors.red,
  errorColor: Colors.orange,

  // Define the default font family.
  fontFamily: 'Hind',
  appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
  bottomSheetTheme:
      const BottomSheetThemeData(backgroundColor: Colors.transparent),

  textTheme: const TextTheme(
      subtitle1: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      subtitle2: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 18, color: Colors.black),
      bodyText2: TextStyle(fontSize: 14, color: Colors.black),
      button: TextStyle(fontSize: 14, color: Colors.white)),

  primaryTextTheme: const TextTheme(
      headline1: TextStyle(fontSize: 30.0, color: Colors.black),
      headline2: TextStyle(fontSize: 25.0, color: Colors.black),
      headline3: TextStyle(fontSize: 20.0, color: Colors.black),
      headline4: TextStyle(fontSize: 15.0, color: Colors.black)),
  textSelectionTheme: const TextSelectionThemeData(),
);
