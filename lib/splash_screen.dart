import 'dart:async';
import 'package:FoodStorm/widgets/home_page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                    builder: (BuildContext context) => TabCupWidget()
                )
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(fontFamily: 'Gilroy'),
      home: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.percent_sharp,
                  size: 70,
                  color: Theme.of(context).primaryColor
                ),
                // SizedBox(width: 5,),
                Text(
                  'Food Storm',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 44
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}