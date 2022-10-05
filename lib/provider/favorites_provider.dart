import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../hive/hive_model.dart';

class FavoritesProvider extends ChangeNotifier{
  late BuildContext context;
  addStockToFav(
  String basic_description,
  String short_description,
  String email,
  String end_date,
  String name_institution,
  String name_stocks,
  String start_date,
  String phone_number,
  String information_about_the_rest,
  String operating_mode,
  String share_size,
  String res_rating,
      String image,
      String icon_res
      ) {
    final favoriteStocks = HiveModel()
      ..basic_description = basic_description
      ..short_description = short_description
      ..email = email
      ..end_date = end_date
      ..name_institution = name_institution
      ..name_stocks = name_stocks
      ..start_date = start_date
      ..phone_number = phone_number
      ..information_about_the_rest = information_about_the_rest
      ..operating_mode = operating_mode
      ..share_size = share_size
      ..res_rating = res_rating
      ..image = image
      ..icon_res = icon_res;
    final box = Boxes.getPostFromFavorite();
    if (box.containsKey(name_institution)) {
    } else {
      box.put(name_institution, favoriteStocks)
      //     .whenComplete(
      //         () => ScaffoldMessenger
      //             .of(context)
      //             .showSnackBar(
      //             SnackBar(
      //                 content: Text(
      //                     'Уже в избранном'
      //                 )
      //             )
      //         )
      // )
      ;
      box.values;
      box.keys;
    }
  }

 Future deleteStock(int groupIndex) async {
    if(!Hive.isAdapterRegistered(0)){
       Hive.registerAdapter(HiveModelAdapter());
    }
    final box = await Hive.openBox<HiveModel>('stocks');
    await box.deleteAt(groupIndex);
}

Future deleteAllStocks() async {
  if(!Hive.isAdapterRegistered(0)){
    Hive.registerAdapter(HiveModelAdapter());
  }
  final box = await Hive.openBox<HiveModel>('stocks');
  await box.clear();
}

}
class Boxes {
  static Box<HiveModel> getPostFromFavorite() =>
      Hive.box<HiveModel>('stocks');
}