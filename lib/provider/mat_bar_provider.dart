import 'package:flutter/cupertino.dart';

class MatTabBarProvider extends ChangeNotifier{
  PageController controller = PageController();
  int currentIndex = 0;

  get pageController => controller;
  get selectedIndex => currentIndex;

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onItemTapped(int index) {
    controller.jumpToPage(index);
    notifyListeners();
  }
}