import 'dart:io';
import 'package:FoodStorm/widgets/screens/splash_screen.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'color/themes.dart';
import 'generated/l10n.dart';
import 'provider/buttons_provider.dart';
import 'provider/favorites_provider.dart';
import 'provider/mat_bar_provider.dart';
import 'provider/send_message_provider.dart';
import 'widgets/cupertino_tab_widget.dart';
import 'widgets/material_tab_widget.dart';

class FoodStormApp extends StatelessWidget {
  const FoodStormApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: sLightTheme,
      dark: sDarkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) => MultiProvider(
        providers: [
          ChangeNotifierProvider<MatTabBarProvider>(
            create: (_) => MatTabBarProvider(),
          ),
          ChangeNotifierProvider<SendMessageProvider>(
            create: (_) => SendMessageProvider(),
          ),
          ChangeNotifierProvider<ButtonsProvider>(
            create: (_) => ButtonsProvider(),
          ),
          ChangeNotifierProvider<FavoritesProvider>(
            create: (_) => FavoritesProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: light,
          darkTheme: dark,
          // home: SplashScreen(),
          home: AnimatedSplashScreen(
            duration: 2000,
            splash: SplashScreen(),
            nextScreen: Platform.isAndroid
                ? MaterialTabWidget()
                : const CupertinoTabWidget(),
            splashIconSize: double.infinity,
            pageTransitionType: PageTransitionType.fade,
            splashTransition: SplashTransition.fadeTransition,
          ),
        ),
      ),
    );
  }
}