import 'package:FoodStorm/helpers/constants.dart';
import '../models/hive/hive_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../generated/l10n.dart';

class FavoritesProvider extends ChangeNotifier {
  addStockToFav(
    BuildContext context,
    String basicDescription,
    String shortDescription,
    String email,
    String endDate,
    String nameInstitution,
    String nameStocks,
    String startDate,
    String phoneNumber,
    String informationAboutTheRest,
    String operatingMode,
    String shareSize,
    String resRating,
    String image,
    String iconRes,
    String fullAddress,
    String shortAddress,
    String linkToTheInt,
    String linkToTheVk,
    List<dynamic> tags,
    List<dynamic> urlPhotos,
  ) {
    final favoriteStocks = HiveModel()
      ..basic_description = basicDescription
      ..short_description = shortDescription
      ..email = email
      ..end_date = endDate
      ..name_institution = nameInstitution
      ..name_stocks = nameStocks
      ..start_date = startDate
      ..phone_number = phoneNumber
      ..information_about_the_rest = informationAboutTheRest
      ..operating_mode = operatingMode
      ..share_size = shareSize
      ..res_rating = resRating
      ..image = image
      ..icon_res = iconRes
      ..full_address = fullAddress
      ..short_address = shortAddress
      ..linkToTheInt = linkToTheInt
      ..linkToTheVk = linkToTheVk
      ..tags = tags
      ..url_photos = urlPhotos;
    final box = Boxes.getPostFromFavorite();
    if (box.containsKey(nameInstitution)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(
            milliseconds: 700,
          ),
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).already_have_text,
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: ConstantsFonts.lightFont,
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      box.put(nameInstitution, favoriteStocks);
      box.keys;
      box.values;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(
            milliseconds: 700,
          ),
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).stock_added_text,
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: ConstantsFonts.lightFont,
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Future deleteStock(
    int groupIndex,
    BuildContext context,
  ) async {
    final box = Hive.box<HiveModel>(ConstantsKeys.hiveStocks);
    await box.deleteAt(groupIndex).whenComplete(
          () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(
                milliseconds: 700,
              ),
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).removed_stock_text,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: ConstantsFonts.lightFont,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }

  Future deleteAllStocks(
    BuildContext context,
  ) async {
    final box = await Hive.openBox<HiveModel>(ConstantsKeys.hiveStocks);
    await box.clear().whenComplete(
          () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).all_stocks_removed,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: ConstantsFonts.lightFont,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}

class Boxes {
  static Box<HiveModel> getPostFromFavorite() =>
      Hive.box<HiveModel>(ConstantsKeys.hiveStocks);
}
