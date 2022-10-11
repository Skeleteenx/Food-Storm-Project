import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../generated/l10n.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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
                  (S.of(context).splash_screen_title),
                  // 'Food Storm',
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