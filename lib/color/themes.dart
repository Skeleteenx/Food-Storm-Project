import 'package:flutter/material.dart';

final sDarkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.black,

    appBarTheme: AppBarTheme(color: Colors.black,));

final sLightTheme = ThemeData.light().copyWith(
    backgroundColor: Color.fromRGBO(60, 180, 110, 1),
    primaryColor: Colors.white,
    canvasColor: Colors.black,
    cardColor: Colors.black45,
    appBarTheme: AppBarTheme(color: Colors.white,)
);
