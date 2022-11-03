import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import '../../provider/add_image_in_storage_provider.dart';
import '../../provider/buttons_provider.dart';
import '../../provider/change_category_provider.dart';
import '../../provider/stocks_template_provider.dart';
import 'add_stocks.dart';

class StocksTabWidget extends StatefulWidget {
  const StocksTabWidget({Key? key}) : super(key: key);

  @override
  State<StocksTabWidget> createState() => _StocksTabWidgetState();
}

class _StocksTabWidgetState extends State<StocksTabWidget>
    with AutomaticKeepAliveClientMixin {
  List<String> categories = ['Все', 'Фастфуд', 'Бургеры', 'Пицца', 'Роллы', 'Шаурма', 'Комбо'];
  String name = '';
  int selectedIndex = 0;
  final CollectionReference stocks = FirebaseFirestore.instance.collection('stocks');
  final CollectionReference stocksSam = FirebaseFirestore.instance.collection('samara');
  String filters = 'Все';

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final favImageProvider = Provider.of<AddImageInStorageProvider>(context);
    final changeProvider = Provider.of<ChangeCategoryProvider>(context);
    final providerButt = Provider.of<ButtonsProvider>(context);
    final templateProvider = Provider.of<StockTemplateProvider>(context);
    return Scaffold(
            appBar: AppBar(
                shadowColor: Theme.of(context).primaryColor,
                elevation: 1.0,
                toolbarHeight: 165,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 42, 0, 0),
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
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'SFPro'
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 38,
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
                                          ).then((context) => {
                                            setState((){
                                              favImageProvider.image = null;
                                            })
                                          }),
                                      child: Text(
                                        S.of(context).add_stock_text,
                                        style: TextStyle(
                                            color: Theme.of(context).primaryColor,
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
                           child: TextField(
                             onChanged: (val){
                               setState(() {
                                 name = val;
                               });
                             },
                             decoration: InputDecoration(
                               contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                               hintText: S.of(context).search_stocks_text,
                               prefixIcon: const Icon(
                                   Icons.search,
                                   size: 26,
                               ),
                               hintStyle: TextStyle(
                                   fontSize: 14,
                                   color: Theme.of(context).indicatorColor,
                                   fontFamily: 'SFProLight'
                               ),
                               fillColor: Theme.of(context).focusColor,
                               filled: true,
                               border: const OutlineInputBorder(
                                   borderSide: BorderSide(
                                     width: 0,
                                     style: BorderStyle.none,
                                   ),
                                   borderRadius: BorderRadius.all(Radius.circular(10))
                               ),
                             ),
                           ),
                         ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) => changeProvider.buildCategory(
                                index,
                                selectedIndex,
                                    () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                context,
                                categories
                            ),
                            // itemBuilder: (context, index) => buildCategory(index)
                          ),
                        ),
                      ]),
                )
            ),
            body: StreamBuilder<QuerySnapshot>(
                  stream: providerButt.selectedCity == S.of(context).tolyatti_text ? changeProvider.changeCategory(categories, stocks, selectedIndex) : changeProvider.changeCategory(categories, stocksSam, selectedIndex),
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
                            return templateProvider.stockTemplate(
                                context, temp['short_description'],
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
                                temp['url_photos']
                            );
                          }
                          if(data['name_institution'].toString().toLowerCase().startsWith(name.toLowerCase())) {
                            return templateProvider.stockTemplate(
                                context, temp['short_description'],
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
                                temp['url_photos']
                            );
                          } else {
                            return Container();
                          }
                        }
                    )
                        : Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                          backgroundColor: Theme.of(context).backgroundColor,
                          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                        )
                    );
                  }
              )

          );
  }

  @override
  bool get wantKeepAlive => true;
}