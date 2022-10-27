import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/target_promo_model.dart';
import '../../provider/favorites_provider.dart';
import '../../provider/send_message_provider.dart';

class SelectedPromoInFavWidget extends StatefulWidget {
  SelectedPromoInFavWidget({super.key, required this.model});
  TargetPromoModel model;

  @override
  State<SelectedPromoInFavWidget> createState() => _SelectedPromoInFavWidgetState();
}

class _SelectedPromoInFavWidgetState extends State<SelectedPromoInFavWidget> {
  List<String> categories = [
    'Все',
    'Фастфуд',
    'Пицца',
    'Шаурма',
    'Роллы',
    'Бургеры'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sendEmailProvider = Provider.of<SendMessageProvider>(context);
    final favProvider = Provider.of<FavoritesProvider>(context);
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IconButton(
                    onPressed: () {
                      favProvider.addStockToFav(
                          context,
                          widget.model.basicDescription,
                          widget.model.shortDescription,
                          widget.model.email,
                          widget.model.endDate,
                          widget.model.nameInstitution,
                          widget.model.nameStocks,
                          widget.model.startDate,
                          widget.model.phoneNumber,
                          widget.model.informationAboutTheRest,
                          widget.model.operatingMode,
                          widget.model.shareSize,
                          widget.model.resRating,
                          widget.model.image,
                          widget.model.iconRes,
                          widget.model.fullAddress,
                          widget.model.shortAddress
                      );
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    )
                ),
              ),
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          widget.model.image
                      )
                  )
              ),
            ),
            expandedHeight: 270,
          )
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 215,
                    child: Text(
                      widget.model.nameStocks,
                      style: const TextStyle(
                          fontSize: 22,
                          fontFamily: 'SFProBold'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      height: 32,
                      width: 72,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 0.1,
                              blurRadius: 3,
                              // offset: Offset(0.1, 0.1),
                            )
                          ],
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(13))),
                      child: Center(
                          child: Text(
                            widget.model.shareSize,
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                                fontSize: 19
                            ),
                          )
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'с ${widget.model.startDate} по ${widget.model.endDate}',
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).highlightColor
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => buildCategory(index),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 77, 0),
                child: Text(
                  widget.model.basicDescription,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                color: Theme.of(context).focusColor,
                height: 1,
                width: double.maxFinite,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'О ресторане',
                style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontSize: 14
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: NetworkImage(widget.model.iconRes)
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.model.nameInstitution,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.star,
                    color: Theme.of(context).dividerColor,
                    size: 16,
                  ),
                  Text(
                    widget.model.resRating,
                    style: const TextStyle(fontSize: 13),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.model.informationAboutTheRest,
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'SFProLight'
                ),
              ),
              const SizedBox(height: 24,),
              Container(
                height: 188,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/marjan-blan-marjanblan-gHCbgGN5TCA-unsplash 1.png')
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(22))
                ),
              ),
              const SizedBox(height: 24,),
              Text(
                'Адрес',
                style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontSize: 14,
                    fontFamily: 'SFProLight'
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.location_solid,
                    color: Theme.of(context).backgroundColor,
                    size: 24,
                  ),
                  const SizedBox(width: 12,),
                   Text(
                    widget.model.fullAddress,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'SFProLight',
                    ),
                  )
                ],
              ),
              const SizedBox(height: 28,),
              Text(
                'Режим работы', style: TextStyle(
                  color: Theme.of(context).highlightColor,
                  fontSize: 14,
                  fontFamily: 'SFProLight'
              ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.time,
                    color: Theme.of(context).backgroundColor,
                    size: 24,
                  ),
                  const SizedBox(width: 12,),
                  Text(
                    widget.model.operatingMode,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'SFProLight',
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => sendEmailProvider.comToInt(widget.model.linkToTheInt),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 40,
                          width: 40,
                          child: Image.asset('assets/images/Frame 130.png'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => sendEmailProvider.comToVk(widget.model.linkToTheVk),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 40,
                          width: 40,
                          child: Center(
                              child: Image.asset('assets/images/Frame 128.png')
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Text(
                    'Пожаловаться',
                    style: TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontSize: 16,
                        fontFamily: 'SFProLight'
                    ),
                  ),
                  const SizedBox(height: 40,),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: const BorderRadius.all(Radius.circular(11))
                      ),
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            _makePhoneCall('tel:${widget.model.phoneNumber}');
                          });
                        },
                        child: Text(
                          'Забронировать',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'SFPro',
                              fontSize: 13
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24,)
                ],
              )
            ],
          ),
        ),
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

  Widget buildCategory(int index) {
    return Container(
      height: 16,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).splashColor,
              spreadRadius: 0.1,
              blurRadius: 0.1,
              offset: const Offset(0.1, 0.1),
            )
          ],
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)
          )
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
                color: Theme.of(context).indicatorColor
            ),
          ),
        ),
      ),
    );
  }
}
