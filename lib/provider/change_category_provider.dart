import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:FoodStorm/helpers/constants.dart';
import 'package:flutter/material.dart';

class ChangeCategoryProvider extends ChangeNotifier {
  Stream<QuerySnapshot<Object?>> changeCategory(
    List<String> filters,
    CollectionReference<Object?> stocks,
    int index,
  ) {
    if (filters[index] == ConstantsKeys.all) {
      return stocks
          .where(
            ConstantsKeys.stocksTags,
            arrayContains: ConstantsKeys.all,
          )
          .snapshots();
    } else {
      return stocks
          .where(
            ConstantsKeys.stocksTags,
            arrayContains: filters[index],
          )
          .snapshots();
    }
  }

  changingCategoryToAnotherOne(int index) {
    ConstantsKeys.selectedIndex = index;
    notifyListeners();
  }

  checkingTheSearch(String val) {
    ConstantsKeys.emptyText = val;
    notifyListeners();
  }

  Widget buildCategory(
    int index,
    int selectedIndex,
    void Function()? func,
    BuildContext context,
    List<String> category,
  ) {
    return GestureDetector(
      onTap: func,
      child: Container(
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? Theme.of(context).focusColor
              : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14.0,
          ),
          child: Center(
            child: Text(
              category[index],
              style: TextStyle(
                fontFamily: ConstantsFonts.lightFont,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: selectedIndex == index
                    ? Theme.of(context).cardColor
                    : Theme.of(context).indicatorColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
