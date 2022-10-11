import 'package:FoodStorm/widgets/screens/fav_tab_widget.dart';
import 'package:FoodStorm/widgets/screens/maps_tab_widget.dart';
import 'package:FoodStorm/widgets/screens/stocks_tab_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/mat_bar_provider.dart';

class MaterialTabWidget extends StatelessWidget {
  MaterialTabWidget({Key? key}) : super(key: key);

  final List<Widget> _tabs = [
    StocksTabWidget(),
    const MapsTabWidget(),
    FavTabWidget()
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
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.percent_sharp,
              ),
              label: 'Акции'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
            ),
            label: 'Карта',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.heart,
              ),
              label: 'Избранное'
          ),
        ],
      ),
    );
  }
}
