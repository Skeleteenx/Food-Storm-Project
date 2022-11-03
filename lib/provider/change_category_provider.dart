import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChangeCategoryProvider extends ChangeNotifier {
  Stream<QuerySnapshot<Object?>> changeCategory(
      List<String> filters,
      CollectionReference<Object?> stocks,
      int index,
  ) {
    if (filters[index] == 'Все') {
      return stocks.where('tags', arrayContains: 'Все').snapshots();

    } else {
      return stocks.where('tags', arrayContains: filters[index],).snapshots();
    }
  }

  Widget buildCategory (int index,int selectedIndex, void Function()? func, BuildContext context, List<String> category){
    return GestureDetector(
      onTap: func,
      child: Container(
        decoration: BoxDecoration(
            color: selectedIndex == index
                ? Theme.of(context).focusColor
                : Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Center(
            child: Text(
              category[index],
              style: TextStyle(
                  fontFamily: 'SFProLight',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: selectedIndex == index
                      ? Theme.of(context).cardColor
                      : Theme.of(context).indicatorColor
              ),
            ),
          ),
        ),
      ),
    );
  }
}