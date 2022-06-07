import 'package:flutter/material.dart';
import 'package:pokedex/app/utilis/colors.utils.dart';

final ThemeData darkAppTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.black54,
  shadowColor: Colors.white12,
  primarySwatch: Colors.amber,

  primaryColorDark: Colors.black54,
  highlightColor: Colors.white70,
  primaryColorLight: ColorsUtils.hexToColor('#DA7B24'), // Icons & Dialogs
  focusColor: Colors.black26,
  indicatorColor: Colors.black,

  errorColor: Colors.red,
  hoverColor: Colors.white,
  dividerColor: Colors.transparent,

  scaffoldBackgroundColor: Colors.black,
  disabledColor: Colors.grey.shade900,
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),

  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.white,
    selectionHandleColor: Colors.white,
    selectionColor: ColorsUtils.hexToColor('#fd9f68'),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white))),

  colorScheme: ColorScheme.dark(
    primary: ColorsUtils.hexToColor('#DA7B24'),
    secondary: Colors.black12,
  ),

  iconTheme: const IconThemeData(
    color: Colors.white,
    size: 37,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      sizeConstraints: BoxConstraints(
          maxHeight: 120, maxWidth: 120, minHeight: 50, minWidth: 50),
      backgroundColor: Colors.white38),

  inputDecorationTheme: const InputDecorationTheme(
      suffixIconColor: Colors.black12,
      fillColor: Colors.white12,
      iconColor: Colors.white,
      errorStyle: TextStyle(fontSize: 12),
      labelStyle: TextStyle(color: Colors.white60),
      hoverColor: Colors.white,
      focusColor: Colors.white,
      alignLabelWithHint: true),

  // Define the default font family.
  fontFamily: 'OpenSans',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 30.0, color: Colors.white),
    headline2: TextStyle(fontSize: 25.0, color: Colors.white),
    headline3: TextStyle(fontSize: 20.0, color: Colors.white),
    headline4: TextStyle(fontSize: 18.0, color: Colors.white),
    headline5: TextStyle(fontSize: 15.0, color: Colors.white),
    headline6: TextStyle(fontSize: 12.0, color: Colors.white),
    button: TextStyle(fontSize: 14.5, color: Colors.white),
  ),

  primaryTextTheme: const TextTheme(
    subtitle1: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
    subtitle2: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white),
    bodyText1: TextStyle(fontSize: 15.0, color: Colors.white),
    bodyText2: TextStyle(fontSize: 12.0, color: Colors.white),
  ),
);
