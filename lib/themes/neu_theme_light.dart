import 'package:flutter/material.dart';

ThemeData neuThemeLight() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: TextStyle(color: Color(0xff4C13F5)),
      headline2: TextStyle(color: Colors.black87),
      button: TextStyle(color: Colors.black),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      backgroundColor: Color(0xffE5E9F2),
      primaryColor: Color(0xff4C13F5),
      accentColor: Color(0xff0095FF),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary));
}
