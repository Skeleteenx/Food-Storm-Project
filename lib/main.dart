import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:food_storm/color/themes.dart';
import 'package:food_storm/provider/buttons_provider.dart';
import 'package:provider/provider.dart';

import 'SplashScreen.dart';

void main() {
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
          ChangeNotifierProvider<ButtonsProvider>(
            create: (_) => ButtonsProvider(),
          ),
        ],
        child: MaterialApp(
          theme: light,
          darkTheme: dark,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
// child: ElevatedButton(
//     onPressed: (){
//       setState(() {
//         _check = !_check;
//         _check ? AdaptiveTheme.of(context).setLight() : AdaptiveTheme.of(context).setDark();
//       });
//     },
//     child: Text(_check ? 'Light' : 'Dark')),