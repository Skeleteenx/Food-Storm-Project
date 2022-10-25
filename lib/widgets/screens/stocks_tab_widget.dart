import 'package:FoodStorm/widgets/screens/selected_promotion_in_promo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/target_promo_model.dart';
import '../../provider/buttons_provider.dart';
import '../../provider/favorites_provider.dart';
import 'add_stocks.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StocksTabWidget extends StatefulWidget {
  const StocksTabWidget({Key? key}) : super(key: key);

  @override
  State<StocksTabWidget> createState() => _StocksTabWidgetState();
}

class _StocksTabWidgetState extends State<StocksTabWidget> {
  List<String> categories = ['Все', 'Фастфуд', 'Пицца', 'Шаурма', 'Роллы', 'Бургеры'];
  String name = '';
  int selectedIndex = 0;
  int pressedAttentionIndex = -1;
  final ref = FirebaseFirestore.instance.collection('stocks');

  @override
  Widget build(BuildContext context) {
    final providerButt = Provider.of<ButtonsProvider>(context);
    final favProvider = Provider.of<FavoritesProvider>(context);
    return Scaffold(
            appBar: AppBar(
                shadowColor: Theme.of(context).primaryColor,
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
                              onTap: () {
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
                                    borderRadius: const BorderRadius.all(Radius.circular(11))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: TextButton(
                                    onPressed: () =>
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    const AddStocks()
                                            )
                                        ),
                                    child: Text(
                                      'Добавить акцию',
                                      style: TextStyle(
                                          color: Theme
                                              .of(context)
                                              .primaryColor,
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
                              onChanged: (val){
                                setState(() {
                                  name = val;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'Поиск по акциям',
                                labelStyle: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).indicatorColor,
                                    fontFamily: 'SFProLight'
                                ),
                                // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                                prefixIcon: const Icon(
                                    Icons.search,
                                    size: 26
                                ),
                                hintStyle: TextStyle(
                                    color: Theme.of(context).indicatorColor
                                ),
                                fillColor: Theme.of(context).focusColor,
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
                            itemBuilder: (context, index) =>
                                buildCategory(index),
                          ),
                        ),
                      ),
                    ])
            ),
            body: const CartsBody(),
          );
  }

  // Future<void> _makePhoneCall(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Widget buildCategory (int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
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
              categories[index],
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

class CartsBody extends StatefulWidget {
  const CartsBody({Key? key}) : super(key: key);

  @override
  State<CartsBody> createState() => _CartsBodyState();
}

class _CartsBodyState extends State<CartsBody> {
  final ref = FirebaseFirestore.instance.collection('stocks');
  String name = '';

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoritesProvider>(context);
    return StreamBuilder<QuerySnapshot>(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          return (snapshots.hasData)
              ? ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: snapshots.data!.docs.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var data = snapshots.data!.docs[index].data() as Map<String, dynamic>;
                var temp = snapshots.data!.docs[index];
                if(name.isEmpty) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) =>
                                SelectedPromoWidgetInPromo(
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
                                      iconRes: temp['icon_res'],
                                      fullAddress: temp['full_address'],
                                      shortAddress: temp['short_address']
                                  ),
                                ),
                          )
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 12),
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
                            borderRadius: const BorderRadius.all(
                                Radius.circular(20))
                        ),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: '${temp['image']}',
                              imageBuilder: (context,
                                  imageProvider) =>
                                  Container(
                                    width: double.infinity,
                                    height: 192,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                      // color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20)
                                      ),
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
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 14,
                                                    vertical: 14
                                                ),
                                                child: Container(
                                                  height: 22,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      color: Theme
                                                          .of(context)
                                                          .primaryColor,
                                                      borderRadius: const BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          9))
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Icon(
                                                          Icons.star,
                                                          color: Theme
                                                              .of(
                                                              context)
                                                              .dividerColor,
                                                          size: 17
                                                      ),
                                                      const SizedBox(
                                                          width: 2),
                                                      Text(
                                                        temp['res_rating'],
                                                        style: const TextStyle(
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
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 14),
                                              child: Align(
                                                alignment: Alignment
                                                    .topRight,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Theme
                                                          .of(context)
                                                          .primaryColor,
                                                      borderRadius: const BorderRadius
                                                          .only(
                                                          bottomLeft: Radius
                                                              .circular(
                                                              11),
                                                          topLeft: Radius
                                                              .circular(
                                                              11)
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
                                                            color: Theme.of(context).backgroundColor,
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
                              placeholder: (context, url) => SizedBox(
                                height: 192,
                                child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20)
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 5,
                                      backgroundColor: Color.fromRGBO(60, 180, 110, 1),
                                      valueColor: AlwaysStoppedAnimation<
                                          Color>(Colors.white),
                                    )
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Container(
                                    height: 192,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              20),
                                          topLeft: Radius.circular(20)
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Не удалось загрузить изображение',
                                          style: TextStyle(
                                              color: Theme
                                                  .of(context)
                                                  .canvasColor,
                                              fontSize: 15,
                                              fontFamily: 'SFProLight'
                                          ),
                                        ),
                                      ],
                                    ),
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
                                            CachedNetworkImage(
                                              imageUrl: '${temp['icon_res']}',
                                              imageBuilder: (context, imageProvider) => Container(
                                                height: 42,
                                                width: 42,
                                                decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius: const BorderRadius.all(Radius.circular(7)),
                                                        color: Theme.of(context).backgroundColor
                                                    ),
                                                  ),
                                              errorWidget: (context, url, error) =>
                                                  Container(),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 5
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    temp.get(
                                                        'name_institution'
                                                    ),
                                                    style: TextStyle(
                                                        color: Theme
                                                            .of(
                                                            context)
                                                            .canvasColor,
                                                        fontSize: 20,
                                                        fontFamily: 'SFProLight'
                                                    ),
                                                  ),
                                                  Text(
                                                    // 'с 18.09 до 25.09',
                                                    'с ${temp.get(
                                                        'start_date')} по ${temp
                                                        .get(
                                                        'end_date')}',
                                                    style: TextStyle(
                                                        color: Theme
                                                            .of(
                                                            context)
                                                            .hintColor,
                                                        fontSize: 14,
                                                        fontFamily: 'SFProLight'
                                                    ),
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
                                                color: Colors
                                                    .transparent,
                                                shape: BoxShape
                                                    .circle,
                                                border: Border.all(
                                                    color: Theme
                                                        .of(context)
                                                        .backgroundColor
                                                ),
                                              ),
                                              child: IconButton(
                                                  onPressed: () async {
                                                    favProvider.addStockToFav(
                                                        context,
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
                                                        temp['full_address'],
                                                        temp['short_address']
                                                    );
                                                  },
                                                  icon: Icon(
                                                      CupertinoIcons.heart,
                                                      size: 27,
                                                      color: Theme.of(context).backgroundColor
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
                                                    _makePhoneCall(
                                                        'tel:${temp['phone_number']}');
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
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets
                                          .fromLTRB(
                                          0, 0, 60, 0
                                      ),
                                      child: Text(
                                        temp.get('short_description'),
                                        style: const TextStyle(
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
                }
                if(data['name_institution'].toString().toLowerCase().startsWith(name.toLowerCase())){
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) =>
                                SelectedPromoWidgetInPromo(
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
                                      iconRes: temp['icon_res'],
                                      fullAddress: temp['full_address'],
                                      shortAddress: temp['short_address']
                                  ),
                                ),
                          )
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
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
                            borderRadius: const BorderRadius.all(
                                Radius.circular(20))
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 192,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        data['image']
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  // color: Colors.white,
                                  borderRadius: const BorderRadius.only(
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
                                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                                          child: Container(
                                            height: 22,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context).primaryColor,
                                                borderRadius: const BorderRadius.all(Radius.circular(9))
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                    Icons.star,
                                                    color: Theme.of(context).dividerColor,
                                                    size: 17
                                                ),
                                                const SizedBox(width: 2),
                                                Text(
                                                  temp['res_rating'],
                                                  style: const TextStyle(
                                                      fontSize: 15
                                                  ),
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
                                        padding: const EdgeInsets.symmetric(vertical: 14),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context).primaryColor,
                                                borderRadius: const BorderRadius.only(
                                                    bottomLeft: Radius.circular(11),
                                                    topLeft: Radius.circular(11))
                                            ),
                                            height: 32,
                                            width: 64,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  temp['share_size'],
                                                  style: TextStyle(
                                                      color: Theme.of(context).backgroundColor,
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
                                color: Theme
                                    .of(context)
                                    .primaryColor,
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
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 5
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    temp.get(
                                                        'name_institution'),
                                                    style: TextStyle(
                                                        color: Theme
                                                            .of(context)
                                                            .canvasColor,
                                                        fontSize: 20,
                                                        fontFamily: 'SFProLight'
                                                    ),
                                                  ),
                                                  Text(
                                                    // 'с 18.09 до 25.09',
                                                    'с ${temp.get('start_date')} по ${temp.get('end_date')}',
                                                    style: TextStyle(
                                                        color: Theme
                                                            .of(context)
                                                            .hintColor,
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
                                                color:
                                                Colors.transparent,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Theme.of(context).backgroundColor
                                                ),
                                              ),
                                              child: IconButton(
                                                  onPressed: () async {
                                                    favProvider.addStockToFav(
                                                      context,
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
                                                      temp['full_address'],
                                                      temp['short_address'],
                                                    );
                                                  },
                                                  icon: Icon(
                                                      CupertinoIcons.heart,
                                                      size: 27,
                                                      color: Theme.of(context).backgroundColor
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
                                                color: Theme
                                                    .of(context)
                                                    .backgroundColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: IconButton(
                                                  onPressed: () {
                                                    _makePhoneCall(
                                                        'tel:${temp['phone_number']}');
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .phone_enabled_outlined,
                                                    size: 26,
                                                    color: Theme
                                                        .of(context)
                                                        .primaryColor,
                                                  )
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Padding(padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
                                      child: Text(
                                        temp.get('short_description'),
                                        style: const TextStyle(
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
                } return Container();
              }
          )
              : const Center(
              child: CircularProgressIndicator()
          );
        }
    );
  }
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
