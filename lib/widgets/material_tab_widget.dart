import 'package:FoodStorm/widgets/screens/stocks_tab_widget.dart';
import 'package:FoodStorm/widgets/screens/maps_tab_widget.dart';
import 'package:FoodStorm/widgets/screens/fav_tab_widget.dart';
import '../provider/mat_bar_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class MaterialTabWidget extends StatelessWidget {
  MaterialTabWidget({Key? key}) : super(key: key);

  final List<Widget> _tabs = [
    const StocksTabWidget(),
    const MapsTabWidget(),
    const FavTabWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<MatTabBarProvider>(context);
    return Scaffold(
      body: PageView(
        controller: tabProvider.pageController,
        onPageChanged: tabProvider.onPageChanged,
        children: _tabs,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).backgroundColor,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: tabProvider.selectedIndex,
        onTap: tabProvider.onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.percent_sharp,
            ),
            label: S.of(context).stocks_tab_text,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.location_on_outlined,
            ),
            label: S.of(context).map_tab_text,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              CupertinoIcons.heart,
            ),
            label: S.of(context).fav_tab_text,
          ),
        ],
      ),
    );
  }
}
