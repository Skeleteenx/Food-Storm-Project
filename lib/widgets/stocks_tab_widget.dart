import 'package:FoodStorm/widgets/selected_promotion_in_promo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/target_promo_model.dart';
import '../provider/buttons_provider.dart';
import '../provider/favorites_provider.dart';
import 'add_stocks.dart';

class StocksTabWidget extends StatefulWidget {
  const StocksTabWidget({Key? key}) : super(key: key);

  @override
  State<StocksTabWidget> createState() => _StocksTabWidgetState();
}

class _StocksTabWidgetState extends State<StocksTabWidget> {
  List<String> categories = ['Все', 'Фастфуд', 'Пицца', 'Шаурма', 'Роллы', 'Бургеры'];
  int selectedIndex = 0;
  bool selectedBool = true;

  final ref = FirebaseFirestore.instance.collection('stocks');

  @override
  Widget build(BuildContext context) {
    final h1 = TextStyle(
        fontFamily: 'SFProSemibold',
        fontSize: 16,
        color: Theme.of(context).canvasColor
    );
    final providerButt = Provider.of<ButtonsProvider>(context);
    final favProvider = Provider.of<FavoritesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
          elevation: 1.0,
          toolbarHeight: 175,
          flexibleSpace: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 42, 14, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          providerButt.showModalSheet(context);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                             Text(
                               'Тольятти',
                               style: TextStyle(
                                   fontSize: 16,
                                   fontFamily: 'SFPro'
                               ),
                             ),
                            // Text(S.of(context).cup_bar_map),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 11,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: const BorderRadius.all(Radius.circular(11))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => AddStocks()
                                  )
                              ),
                              child: const Text(
                                'Добавить акцию',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SFPro',
                                    fontSize: 13
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Поиск по акциям',
                        labelStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                            fontFamily: 'SFProLight'
                        ),
                        // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 26
                        ),
                        hintStyle: const TextStyle(
                            color: Colors.black38
                        ),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(11))
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: SizedBox(
                    height: 30,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) => buildCategory(index),
                    ),
                  ),
                ),
              ])
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var temp = snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => SelectedPromoWidgetInPromo(
                              model: TargetPromoModel(
                                  shortDescription: temp['short_description'],
                                  email: temp['email'],
                                  endDate: temp['end_date'],
                                  basicDescription: temp['basic_description'],
                                  nameStocks: temp['name_stocks'],
                                  nameInstitution: temp['name_institution'],
                                  startDate: temp['start_date'],
                                  phoneNumber: temp['phone_number'],
                                  informationAboutTheRest: temp['information_about_the_rest'],
                                  operatingMode: temp['operating_mode'],
                                  shareSize: temp['share_size'],
                                  resRating: temp['res_rating'],
                                  image: temp['image'],
                                  iconRes: temp['icon_res']
                              ),
                            ),
                        )
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 331,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            )
                          ],
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(
                        children: [
                          Container(
                              width: double.infinity,
                              height: 192,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      '${temp['image']}',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20)
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14, vertical: 14),
                                          child: Container(
                                            height: 22,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9))
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                Icon(
                                                    Icons.star,
                                                    color: Colors.orange,
                                                    size: 17
                                                ),
                                                SizedBox(width: 2),
                                                Text(
                                                  temp['res_rating'],
                                                  style: TextStyle(
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14
                                        ),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                        11),
                                                    topLeft: Radius.circular(11)
                                                )
                                            ),
                                            height: 32,
                                            width: 64,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                  temp['share_size'],
                                                  style: TextStyle(
                                                      color: Theme
                                                          .of(context)
                                                          .backgroundColor,
                                                      fontSize: 20,
                                                      fontFamily: 'SFProLight'
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          Container(
                            height: 139,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 40,
                                              width: 40,
                                              child: Image.network(
                                                  '${temp['icon_res']}'
                                              )
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  temp.get('name_institution'),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontFamily: 'SFProLight'
                                                  ),
                                                ),
                                                Text(
                                                  // 'с 18.09 до 25.09',
                                                  'с ${temp.get('start_date')} по ${temp.get('end_date')}',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                      fontFamily: 'SFProLight'),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 42,
                                            width: 42,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Theme.of(context).backgroundColor
                                              ),
                                            ),
                                            child: IconButton(
                                                onPressed: ()async {
                                                  await favProvider.addStockToFav(
                                                      temp['basic_description'],
                                                      temp['short_description'],
                                                      temp['email'],
                                                      temp['end_date'],
                                                      temp['name_institution'],
                                                      temp['name_stocks'],
                                                      temp['start_date'],
                                                      temp['phone_number'],
                                                      temp['information_about_the_rest'],
                                                      temp['operating_mode'],
                                                      temp['share_size'],
                                                      temp['res_rating'],
                                                      temp['image'],
                                                      temp['icon_res'],
                                                  );
                                                },
                                                icon: Icon(
                                                  CupertinoIcons.heart,
                                                  size: 27,
                                                  color: Theme.of(context).backgroundColor,
                                                )
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          Container(
                                            height: 42,
                                            width: 42,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).backgroundColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: IconButton(
                                                onPressed: () {
                                                  _makePhoneCall('tel:${temp['phone_number']}');
                                                },
                                                icon: Icon(
                                                  Icons.phone_enabled_outlined,
                                                  size: 26,
                                                  color: Theme.of(context).primaryColor,
                                                )
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
                                    child: Text(
                                      temp.get('short_description'),
                                      style: TextStyle(
                                          fontFamily: 'SFProLight',
                                          fontSize: 16
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if(snapshot.connectionState == ConnectionState.active){
            return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      'Проверьте интернет соединение',
                      style: h1
                  ),
                )
            );
          } else {
            return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      'В данный момент акции отсутствуют',
                      style: h1
                  ),
                )
            );
          }
        }
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
                  fontSize: 15,
                  color: selectedIndex == index
                      ? Colors.black54
                      : Colors.black38
              ),
            ),
          ),
        ),
      ),
    );
  }
}