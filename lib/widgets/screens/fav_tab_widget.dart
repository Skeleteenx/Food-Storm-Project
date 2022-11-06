import 'package:FoodStorm/widgets/screens/selected_promotion.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../provider/favorites_provider.dart';
import '../../models/target_promo_model.dart';
import '../../provider/mat_bar_provider.dart';
import 'package:hive_flutter/adapters.dart';
import '../../models/hive/hive_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../helpers/constants.dart';
import '../../generated/l10n.dart';

class FavTabWidget extends StatefulWidget {
  const FavTabWidget({Key? key}) : super(key: key);

  @override
  State<FavTabWidget> createState() => _FavTabWidgetState();
}

class _FavTabWidgetState extends State<FavTabWidget> {
  final hiveBox = Hive.box<HiveModel>(ConstantsKeys.hiveStocks);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<HiveModel>>(
        valueListenable: hiveBox.listenable(),
        builder: (context, Box<HiveModel> value, _) {
          if (hiveBox.isNotEmpty) {
            // ignore: prefer_const_constructors
            return StocksPresent();
          } else {
            return const ArentStocks();
          }
        });
  }
}

class StocksPresent extends StatefulWidget {
  const StocksPresent({Key? key}) : super(key: key);

  @override
  State<StocksPresent> createState() => _StocksPresentState();
}

class _StocksPresentState extends State<StocksPresent> {
  final hiveBox = Hive.box<HiveModel>(ConstantsKeys.hiveStocks);

  void _deleteAll(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        final favProvider = Provider.of<FavoritesProvider>(context);
        return AlertDialog(
          title: Text(
            S.of(context).confirm_text,
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: ConstantsFonts.lightFont,
            ),
          ),
          content: Text(
            S.of(context).sure_confirm_text,
            style: TextStyle(
              fontFamily: ConstantsFonts.lightFont,
              color: Theme.of(context).cardColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                favProvider.deleteAllStocks(context);
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).yes_text,
                style: ConstantsTextStyle.greenText,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).no_text,
                style: ConstantsTextStyle.greenText,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hiveList = hiveBox.values.toList().cast<HiveModel>();
    final favProvider = Provider.of<FavoritesProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              width: double.maxFinite,
              height: 40.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).fav_tab_text,
                    style: ConstantsTextStyle.h1,
                  ),
                  GestureDetector(
                    onTap: () => _deleteAll(context),
                    child: Text(
                      S.of(context).clear_text,
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontSize: 14.0,
                        fontFamily: ConstantsFonts.lightFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 604.0,
              child: GridView.builder(
                itemCount: hiveBox.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 189.0,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => SelectedPromoWidgetInPromo(
                            model: TargetPromoModel(
                              shortDescription:
                                  '${hiveList[index].short_description}',
                              email: '${hiveList[index].email}',
                              endDate: '${hiveList[index].end_date}',
                              basicDescription:
                                  '${hiveList[index].basic_description}',
                              nameStocks: '${hiveList[index].name_stocks}',
                              nameInstitution:
                                  '${hiveList[index].name_institution}',
                              startDate: '${hiveList[index].start_date}',
                              phoneNumber: '${hiveList[index].phone_number}',
                              informationAboutTheRest:
                                  '${hiveList[index].information_about_the_rest}',
                              operatingMode:
                                  '${hiveList[index].operating_mode}',
                              shareSize: '${hiveList[index].share_size}',
                              resRating: '${hiveList[index].res_rating}',
                              image: '${hiveList[index].image}',
                              iconRes: '${hiveList[index].icon_res}',
                              fullAddress: '${hiveList[index].full_address}',
                              shortAddress: '${hiveList[index].short_address}',
                              linkToTheInt: '${hiveList[index].linkToTheInt}',
                              linkToTheVk: '${hiveList[index].linkToTheVk}',
                              tags: hiveList[index].tags as List<dynamic>,
                              urlPhotos:
                                  hiveList[index].url_photos as List<dynamic>,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).splashColor,
                            spreadRadius: 0.1,
                            blurRadius: 4.0,
                            offset: const Offset(0.1, 0.1),
                          ),
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(11.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: '${hiveList[index].image}',
                            imageBuilder: (context, imageProvider) => Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(11.0),
                                    topRight: Radius.circular(11.0),
                                  ),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                height: 128.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 12.0,
                                            ),
                                            child: Container(
                                              height: 24.0,
                                              width: 45.0,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${hiveList[index].share_size}',
                                                    style:
                                                        ConstantsTextStyle.h5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                favProvider.deleteStock(
                                                  index,
                                                  context,
                                                );
                                              },
                                              icon: Icon(
                                                shadows: const [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                  )
                                                ],
                                                CupertinoIcons.heart_fill,
                                                size: 25.0,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            placeholder: (context, url) => SizedBox(
                              height: 113.0,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11.0),
                                      topRight: Radius.circular(11.0),
                                    ),
                                  ),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 5,
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => SizedBox(
                              height: 113,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11.0),
                                      topRight: Radius.circular(11.0),
                                    ),
                                  ),
                                  child: Text(
                                    S.of(context).error_text,
                                    style: TextStyle(
                                      fontFamily: ConstantsFonts.semiBoldFont,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(11.0),
                                  topRight: Radius.circular(11.0),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    '${hiveList[index].image}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: 128.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12.0,
                                          ),
                                          child: Container(
                                            height: 24.0,
                                            width: 45.0,
                                            decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  spreadRadius: 5.0,
                                                  blurRadius: 7.0,
                                                  offset: Offset(5.0, 5.0),
                                                ),
                                              ],
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${hiveList[index].share_size}',
                                                  style: ConstantsTextStyle.h5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                favProvider.deleteStock(
                                                  index,
                                                  context,
                                                );
                                              },
                                              icon: Icon(
                                                shadows: const [
                                                  BoxShadow(
                                                    blurRadius: 7.0,
                                                  ),
                                                ],
                                                CupertinoIcons.heart_fill,
                                                size: 25.0,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              height: 75.0,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    6.0, 6.0, 6.0, 6.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              '${hiveList[index].icon_res}',
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            height: 28.0,
                                            width: 28.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(50.0),
                                              ),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              Container(
                                            height: 26.0,
                                            width: 26.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(50.0),
                                              ),
                                              color: Theme.of(context)
                                                  .backgroundColor,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const SizedBox(
                                            height: 26.0,
                                            width: 26.0,
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${hiveList[index].name_institution}',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily:
                                                      ConstantsFonts.lightFont,
                                                ),
                                              ),
                                              Text(
                                                ("с ${hiveList[index].start_date} по ${hiveList[index].end_date}"),
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                  fontSize: 10.0,
                                                  fontFamily:
                                                      ConstantsFonts.lightFont,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 4.0, 0.0, 6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                size: 13.0,
                                              ),
                                              Text(
                                                '${hiveList[index].short_address}',
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Theme.of(context)
                                                    .dividerColor,
                                                size: 12.0,
                                              ),
                                              Text(
                                                '${hiveList[index].res_rating}',
                                                style: const TextStyle(
                                                  fontSize: 9.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
    final tabProvider = Provider.of<MatTabBarProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  width: double.maxFinite,
                  height: 40.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).fav_tab_text,
                        style: ConstantsTextStyle.h1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 230.0,
                ),
                Text(
                  S.of(context).thirst_fav_info_text,
                  style: ConstantsTextStyle.h4,
                ),
                Text(
                  S.of(context).second_fav_info_text,
                  style: ConstantsTextStyle.h4,
                ),
                Text(
                  S.of(context).third_fav_info_text,
                  style: ConstantsTextStyle.h4,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 44.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(11.0),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        tabProvider.onItemTapped(0);
                      },
                      child: Text(
                        S.of(context).go_to_stocks_text,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: ConstantsFonts.sfProFont,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
