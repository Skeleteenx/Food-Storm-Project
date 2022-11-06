import 'package:flutter/material.dart';

final sDarkTheme = ThemeData.dark().copyWith(
  secondaryHeaderColor: const Color.fromRGBO(233, 245, 238, 1),
  backgroundColor: const Color.fromRGBO(60, 180, 110, 1),
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: const Color.fromRGBO(60, 180, 110, 1),
      ),
  appBarTheme: const AppBarTheme(color: Colors.black),
  shadowColor: const Color.fromRGBO(18, 18, 29, 0.8),
  highlightColor: Colors.grey.shade400,
  toggleableActiveColor: Colors.red,
  focusColor: Colors.grey.shade300,
  indicatorColor: Colors.white38,
  dividerColor: Colors.orange,
  splashColor: Colors.white12,
  primaryColor: Colors.black,
  cardColor: Colors.white54,
  canvasColor: Colors.white,
  errorColor: Colors.blue,
  hintColor: Colors.grey,
);

final sLightTheme = ThemeData.light().copyWith(
  secondaryHeaderColor: const Color.fromRGBO(233, 245, 238, 1),
  backgroundColor: const Color.fromRGBO(60, 180, 110, 1),
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: const Color.fromRGBO(60, 180, 110, 1),
      ),
  appBarTheme: const AppBarTheme(color: Colors.white),
  shadowColor: const Color.fromRGBO(18, 18, 29, 0.8),
  highlightColor: Colors.grey.shade400,
  toggleableActiveColor: Colors.red,
  focusColor: Colors.grey.shade300,
  indicatorColor: Colors.black38,
  dividerColor: Colors.orange,
  splashColor: Colors.black12,
  primaryColor: Colors.white,
  cardColor: Colors.black45,
  canvasColor: Colors.black,
  errorColor: Colors.blue,
  hintColor: Colors.grey,
);
