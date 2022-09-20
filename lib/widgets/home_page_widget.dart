import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'fav_tab_widget.dart';
import 'maps_tab_widget.dart';
import 'stocks_tab_widget.dart';

class TabCupWidget extends StatefulWidget {
  const TabCupWidget({Key? key}) : super(key: key);

  @override
  State<TabCupWidget> createState() => _TabCupWidgetState();
}

class _TabCupWidgetState extends State<TabCupWidget> {
  List<String> categories = ['Все', 'Фастфуд', 'Пицца', 'Шаурма', 'Роллы', 'Бургеры'];
  int selectedIndex = 0;
  final List<Widget> _tabs = [
    StocksTabWidget(),
    const MapsTabWidget(),
    const FavTabWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            activeColor: Theme.of(context).backgroundColor,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.percent_sharp,
                      // color: Theme.of(context).primaryColor
                  ),
                  label: 'Акции'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.location_on_outlined,
                    // color: Theme.of(context).primaryColor
                  ),
                  label: 'Карта'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.heart,
                    // color: Theme.of(context).primaryColor
                  ),
                  label: 'Избранное'
              ),
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return _tabs[index];
          },
        ),
      ),
    );
  }
  Widget buildCategory (int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: selectedIndex == index ? Colors.grey.shade300 : Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Center(
            child: Text(
              categories[index],
              style: TextStyle(
                  fontFamily: 'SFProLight',
                  fontWeight: FontWeight.bold,
                  fontSize: 15, color: selectedIndex == index ? Colors.black54 : Colors.black38),
            ),
          ),
        ),
      ),
    );
  }
}
