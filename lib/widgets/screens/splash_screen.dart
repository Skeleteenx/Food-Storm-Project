import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import '../../helpers/constants.dart';
import '../../generated/l10n.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        fontFamily: ConstantsFonts.gilroyFont,
      ),
      home: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 80.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.percent_sharp,
                  size: 70.0,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  (S.of(context).app_name_text),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 44.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
