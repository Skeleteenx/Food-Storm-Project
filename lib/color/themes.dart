import 'package:flutter/material.dart';

final sDarkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.black, appBarTheme: AppBarTheme(color: Colors.black,));

final sLightTheme = ThemeData.light().copyWith(
    backgroundColor: Color.fromRGBO(60, 185, 110, 1),
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.white,));
