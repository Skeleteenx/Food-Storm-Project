import 'package:FoodStorm/widgets/selected_promo_in_fav_widget.dart';
import 'package:FoodStorm/widgets/stocks_tab_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import '../hive/hive_model.dart';
import '../models/target_promo_model.dart';
import '../provider/favorites_provider.dart';
import 'home_page_widget.dart';

class FavTabWidget extends StatefulWidget {
  FavTabWidget({Key? key}) : super(key: key);

  @override
  State<FavTabWidget> createState() => _FavTabWidgetState();
}

class _FavTabWidgetState extends State<FavTabWidget> {
  final hiveBox = Hive.box<HiveModel>('stocks');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hiveBox.listenable(),
      builder: (context, Box<HiveModel> value, _) {
        if(hiveBox.isNotEmpty){
          return StocksPresent();
        }else{
          return ArentStocks();
        }
      }
    );
  }
}

class StocksPresent extends StatefulWidget {
  const StocksPresent({Key? key}) : super(key: key);

  @override
  State<StocksPresent> createState() => _StocksPresentState();
}

class _StocksPresentState extends State<StocksPresent> {
  final hiveBox = Hive.box<HiveModel>('stocks');

  void  _deleteAll(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          final favProvider = Provider.of<FavoritesProvider>(context);
          return AlertDialog(
            title: const Text(
              'Пожалуйста подтвердите',
              style: TextStyle(
                fontSize: 20,
              fontFamily: 'SFProLight',
            ),
            ),
            content: const Text(
              'Вы точно хотите удалить все акции из избранного?',
              style: TextStyle(
                fontFamily: 'SFProLight',
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    favProvider.deleteAllStocks().whenComplete(
                            () => ScaffoldMessenger
                            .of(context)
                            .showSnackBar(
                            SnackBar(
                                backgroundColor: Color.fromRGBO(233, 245, 238, 1),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Все акции удалены из избранного',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'SFProLight',
                                          color: Theme.of(context).canvasColor
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){

                                      },
                                      child: Text(
                                        'Отменить',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'SFProLight',
                                            color: Colors.blue
                                        ),
                                      ),
                                    )
                                  ],
                                )
                            )
                        )
                    );
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Да',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'SFProLight',
                    ),
                  ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Нет',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SFProLight',
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final hiveList = hiveBox.values.toList().cast<HiveModel>();
    final h1 = TextStyle(
        fontFamily: 'SFProSemibold',
        fontSize: 24,
        color: Theme.of(context).canvasColor
    );
    final favProvider = Provider.of<FavoritesProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                  )
              ),
              width: double.maxFinite,
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Избранное', style: h1,),
                  GestureDetector(
                    onTap: () => _deleteAll(context),
                    child: Text(
                      'Очистить',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'SFProLight'
                    ),),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 600,
              child: GridView.builder(
                itemCount: hiveBox.length,
                physics: BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 189,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (_) => SelectedPromoInFavWidget(
                                model: TargetPromoModel(
                                    shortDescription: '${hiveList[index].short_description}',
                                    email: '${hiveList[index].email}',
                                    endDate: '${hiveList[index].end_date}',
                                    basicDescription: '${hiveList[index].basic_description}',
                                    nameStocks: '${hiveList[index].name_stocks}',
                                    nameInstitution: '${hiveList[index].name_institution}',
                                    startDate: '${hiveList[index].start_date}',
                                    phoneNumber: '${hiveList[index].phone_number}',
                                    informationAboutTheRest: '${hiveList[index].information_about_the_rest}',
                                    operatingMode: '${hiveList[index].operating_mode}',
                                    shareSize: '${hiveList[index].share_size}',
                                    resRating: '${hiveList[index].res_rating}',
                                    image: '${hiveList[index].image}',
                                    iconRes: '${hiveList[index].icon_res}'
                                ),
                              )
                          )
                      );
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedPromoWidget()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      topRight: Radius.circular(11)
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${hiveList[index].image}'
                                    ),
                                    fit: BoxFit.cover,
                                  )
                              ),
                              height: 128,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          child: Container(
                                            height: 24,
                                            width: 45,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    bottomRight: Radius.circular(8),
                                                    topRight: Radius.circular(8)
                                                )
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${hiveList[index].share_size}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Theme.of(context).backgroundColor
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: ()  {
                                                 favProvider.deleteStock(index).whenComplete(
                                                        () => ScaffoldMessenger
                                                            .of(context)
                                                            .showSnackBar(
                                                            SnackBar(
                                                              backgroundColor: Color.fromRGBO(233, 245, 238, 1),
                                                                content: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        'Удалено из избранного',
                                                                      style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontFamily: 'SFProLight',
                                                                        color: Theme.of(context).canvasColor
                                                                      ),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap: (){

                                                                      },
                                                                      child: Text(
                                                                        'Отменить',
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontFamily: 'SFProLight',
                                                                              color: Colors.blue
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                )
                                                            )
                                                        )
                                                );
                                            },
                                              icon: Icon(
                                              shadows: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                )
                                              ],
                                              CupertinoIcons.heart_fill,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(11)
                                ),
                              ),
                              height: 65,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(6, 6, 12, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            height: 22.75,
                                            width: 26,
                                            child: Image.network(
                                                '${hiveList[index].icon_res}'
                                            )
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 1),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${hiveList[index].name_institution}',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'SFProLight'),
                                              ),
                                              Text(
                                                // 'с 18.10 до 26.05',
                                                ("с ${hiveList[index].start_date} по ${hiveList[index].end_date}"),
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                    fontFamily: 'SFProLight'
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 4, 0, 6),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row( //1
                                            children: [
                                              Icon(
                                                CupertinoIcons.location_solid,
                                                size: 13,
                                              ),
                                              Text(
                                                'Строителей',
                                                style: TextStyle(
                                                    fontSize: 10
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row( //2
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 12,
                                              ),
                                              Text(
                                                '${hiveList[index].res_rating}',
                                                style: TextStyle(
                                                    fontSize: 9
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArentStocks extends StatefulWidget {
  const ArentStocks({Key? key}) : super(key: key);

  @override
  State<ArentStocks> createState() => _ArentStocksState();
}

class _ArentStocksState extends State<ArentStocks> {
  @override
  Widget build(BuildContext context) {
    final h1 = TextStyle(
        fontSize: 14,
        fontFamily: 'SFPro'
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text(
          'Избранное',
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'SFProSemibold',
              color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Здесь отображаются избранные акции.',
                  style: h1
              ),
              Text('Нажмите на сердечко, чтобы добавить акцию',
                style: h1,
              ),
              Text(
                'в “Избранное”.',
                style: h1,
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(11))
                  ),
                  child: TextButton(
                    onPressed: (){},
                    child: Text(
                      'Перейти к акциям',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SFPro',
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}