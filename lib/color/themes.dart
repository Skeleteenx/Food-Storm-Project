import 'package:flutter/material.dart';

final sDarkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.black,

    appBarTheme: const AppBarTheme(color: Colors.black,));

final sLightTheme = ThemeData.light().copyWith(
    colorScheme: ThemeData().colorScheme.copyWith(primary: const Color.fromRGBO(60, 180, 110, 1),),
    toggleableActiveColor: Colors.red,
    backgroundColor: const Color.fromRGBO(60, 180, 110, 1),
    primaryColor: Colors.white,
    canvasColor: Colors.black,
    cardColor: Colors.black45,
    highlightColor: Colors.grey.shade400,
    dividerColor: Colors.orange,
    splashColor: Colors.black12,
    errorColor: Colors.blue,
    shadowColor: const Color.fromRGBO(18, 18, 29, 0.8),
    hintColor: Colors.grey,
    indicatorColor: Colors.black38,
    focusColor: Colors.grey.shade300,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
    )
);
