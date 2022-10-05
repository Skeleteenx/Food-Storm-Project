import 'package:FoodStorm/hive/hive_model.dart';
import 'package:FoodStorm/provider/favorites_provider.dart';
import 'package:FoodStorm/provider/buttons_provider.dart';
import 'package:FoodStorm/provider/send_message_provider.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'splash_screen.dart';
import 'color/themes.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveModelAdapter());
  await Hive.openBox<HiveModel>('stocks');
  await Firebase.initializeApp();
  runApp(const FoodStorm());
}

class FoodStorm extends StatelessWidget {
  const FoodStorm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: sLightTheme,
      dark: sDarkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) => MultiProvider(
        providers: [
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
          home: SplashScreen(),
        ),
      ),
    );
  }
}