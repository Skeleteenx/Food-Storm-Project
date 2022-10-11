import 'package:FoodStorm/hive/hive_model.dart';
import 'package:FoodStorm/food_storm_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveModelAdapter());
  await Hive.openBox<HiveModel>('stocks');
  await Firebase.initializeApp();
  runApp(const FoodStormApp());
}