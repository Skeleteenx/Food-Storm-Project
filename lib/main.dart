import 'package:FoodStorm/helpers/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:FoodStorm/food_storm_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';
import 'models/hive/hive_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveModelAdapter());
  await Hive.openBox<HiveModel>(ConstantsKeys.hiveStocks);
  await Firebase.initializeApp();
  runApp(const FoodStormApp());
}
