import '../../provider/add_image_in_storage_provider.dart';
import '../../provider/change_category_provider.dart';
import '../../provider/stocks_template_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:FoodStorm/helpers/constants.dart';
import '../../provider/buttons_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import 'add_stocks.dart';

class StocksTabWidget extends StatefulWidget {
  const StocksTabWidget({Key? key}) : super(key: key);

  @override
  State<StocksTabWidget> createState() => _StocksTabWidgetState();
}

class _StocksTabWidgetState extends State<StocksTabWidget>
    with AutomaticKeepAliveClientMixin {
  final CollectionReference stocks =
      FirebaseFirestore.instance.collection(ConstantsKeys.togliatti);
  final CollectionReference stocksSam =
      FirebaseFirestore.instance.collection(ConstantsKeys.samara);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final favImageProvider = Provider.of<AddImageInStorageProvider>(context);
    final templateProvider = Provider.of<StockTemplateProvider>(context);
    final changeProvider = Provider.of<ChangeCategoryProvider>(context);
    final providerButt = Provider.of<ButtonsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).primaryColor,
        elevation: 1.0,
        toolbarHeight: 165.0,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 42.0, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        providerButt.showModalSheet(context);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            providerButt.selectedCity,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: ConstantsFonts.sfProFont,
                            ),
                          ),
                          const SizedBox(
                            height: 7.0,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 38.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(11.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const AddStocks(),
                              ),
                            ).then(
                              (context) => favImageProvider.zeroingTheImage(),
                            ),
                            child: Text(
                              S.of(context).add_stock_text,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: ConstantsFonts.sfProFont,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: 40.0,
                child: TextField(
                  onChanged: (val) => changeProvider.checkingTheSearch(val),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 12.0,
                    ),
                    hintText: S.of(context).search_stocks_text,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 26.0,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 14.0,
                      color: Theme.of(context).indicatorColor,
                      fontFamily: ConstantsFonts.lightFont,
                    ),
                    fillColor: Theme.of(context).focusColor,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: 30.0,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: ConstantsKeys.categories.length,
                  itemBuilder: (context, index) => changeProvider.buildCategory(
                    index,
                    ConstantsKeys.selectedIndex,
                    () => changeProvider.changingCategoryToAnotherOne(index),
                    context,
                    ConstantsKeys.categories,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: providerButt.selectedCity == S.of(context).tolyatti_text
            ? changeProvider.changeCategory(
                ConstantsKeys.categories,
                stocks,
                ConstantsKeys.selectedIndex,
              )
            : changeProvider.changeCategory(
                ConstantsKeys.categories,
                stocksSam,
                ConstantsKeys.selectedIndex,
              ),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          return (snapshots.hasData)
              ? ListView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: snapshots.data!.docs.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = snapshots.data!.docs[index].data()
                        as Map<String, dynamic>;
                    var temp = snapshots.data!.docs[index];
                    if (ConstantsKeys.emptyText.isEmpty) {
                      return templateProvider.stockTemplate(
                        context,
                        temp['short_description'],
                        temp['email'],
                        temp['end_date'],
                        temp['basic_description'],
                        temp['name_stocks'],
                        temp['name_institution'],
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
                        temp['link_to_the_int'],
                        temp['link_to_the_vk'],
                        temp['tags'],
                        temp['url_photos'],
                      );
                    }
                    if (data['name_institution']
                        .toString()
                        .toLowerCase()
                        .startsWith(
                          ConstantsKeys.emptyText.toLowerCase(),
                        )) {
                      return templateProvider.stockTemplate(
                        context,
                        temp['short_description'],
                        temp['email'],
                        temp['end_date'],
                        temp['basic_description'],
                        temp['name_stocks'],
                        temp['name_institution'],
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
                        temp['link_to_the_int'],
                        temp['link_to_the_vk'],
                        temp['tags'],
                        temp['url_photos'],
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              : Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5.0,
                    backgroundColor: Theme.of(context).backgroundColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
