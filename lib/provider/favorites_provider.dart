import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../hive/hive_model.dart';

class FavoritesProvider extends ChangeNotifier{
    addStockToFav (
        BuildContext context,
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
        String icon_res,
        String full_address,
        String short_address
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
      ..icon_res = icon_res
      ..full_address = full_address
      ..short_address = short_address;
    final box = Boxes.getPostFromFavorite();
    if (box.containsKey(name_institution)) {
      ScaffoldMessenger
          .of(context)
          .showSnackBar(
          SnackBar(
              backgroundColor: const Color.fromRGBO(233, 245, 238, 1),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Эта акция уже находится в избранном.',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SFProLight',
                        color: Theme.of(context).canvasColor
                    ),
                  ),
                ],
              )
          )
      );
    } else {
      box.put(name_institution, favoriteStocks);
      box.keys;
      box.values;
      ScaffoldMessenger
          .of(context)
          .showSnackBar(
          SnackBar(
              backgroundColor: const Color.fromRGBO(233, 245, 238, 1),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Акция добавлена в избранное.',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SFProLight',
                        color: Theme.of(context).canvasColor
                    ),
                  ),
                ],
              )
          )
      );
    }
  }

 Future deleteStock(int groupIndex, BuildContext context) async {
    final box = Hive.box<HiveModel>('stocks');
    await box.deleteAt(groupIndex).whenComplete(
            () => ScaffoldMessenger
            .of(context)
            .showSnackBar(
            SnackBar(
                backgroundColor: const Color.fromRGBO(233, 245, 238, 1),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Акция удалена из избранного.',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SFProLight',
                          color: Theme.of(context).canvasColor
                      ),
                    ),
                  ],
                )
            )
        )
    );;
}

 Future deleteAllStocks() async {
  final box = await Hive.openBox<HiveModel>('stocks');
  await box.clear();
}

}
class Boxes {
  static Box<HiveModel> getPostFromFavorite() =>
      Hive.box<HiveModel>('stocks');
}