import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import '../../models/target_promo_model.dart';
import '../../provider/favorites_provider.dart';
import '../../provider/send_message_provider.dart';

class SelectedPromoWidgetInPromo extends StatefulWidget {
  SelectedPromoWidgetInPromo({super.key, required this.model});
  TargetPromoModel model;

  @override
  State<SelectedPromoWidgetInPromo> createState() => _SelectedPromoWidgetInPromoState();
}

class _SelectedPromoWidgetInPromoState extends State<SelectedPromoWidgetInPromo> {

  int selectedIndex = 0;

  @override
  void dispose() {
    selectedIndex;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoritesProvider>(context);
    final sendProvider = Provider.of<SendMessageProvider>(context);
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IconButton(
                    onPressed: ()  {
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
                           widget.model.shortAddress,
                           widget.model.linkToTheInt,
                           widget.model.linkToTheVk,
                           widget.model.tags,
                           widget.model.urlPhotos
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
            flexibleSpace: CachedNetworkImage(
              imageUrl: widget.model.image,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: imageProvider
                    )
                ),
              ),
              placeholder: (context, url) => Container(
                  color: Theme.of(context).splashColor,
                  alignment: Alignment.center,
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  backgroundColor: Theme.of(context).backgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                )
              ),
              errorWidget: (context, url, error) => Container(
                  color: Theme.of(context).splashColor,
                  alignment: Alignment.center,
                  child: Text(
                    S.of(context).error_text,
                    style: const TextStyle(
                      fontFamily: 'SFProBold',
                      fontSize: 20
                    ),
                  )
              ),
            ),
            expandedHeight: 270,
          )
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).splashColor,
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
              const SizedBox(height: 8,),
              Text(
                'с ${widget.model.startDate} по ${widget.model.endDate}',
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).highlightColor
                ),
              ),
              const SizedBox(height: 16,),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.model.tags.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 3),
                    height: 26,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).splashColor,
                            spreadRadius: 0.1,
                            blurRadius: 0.1,
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
                          widget.model.tags[index],
                          style: TextStyle(
                              fontFamily: 'SFProLight',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Theme.of(context).indicatorColor
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 77, 0),
                child: Text(
                  widget.model.basicDescription,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 24,),
              Container(
                color: Theme.of(context).focusColor,
                height: 1,
                width: double.maxFinite,
              ),
              const SizedBox(height: 24,),
              Text(
                S.of(context).about_inst_text,
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
                  CachedNetworkImage(
                      imageUrl: widget.model.iconRes,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: imageProvider
                          ),
                        ),
                      ),
                    placeholder: (context, url) => Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                          color: Theme.of(context).backgroundColor
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      margin: const EdgeInsets.only(left: 1.7),
                      height: 42,
                      width: 42,
                      child: const CircularProgressIndicator(),
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
              SizedBox(
                height: 188,
                child: Stack(
                  children: [
                    PageView.builder(
                        onPageChanged: (value){
                          setState((){
                            selectedIndex = value;
                          });
                        },
                        itemCount: widget.model.urlPhotos.length,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CachedNetworkImage(
                              imageUrl: widget.model.urlPhotos[index],
                              imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(22))
                              ),
                            ),
                              placeholder: (context, index) => Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).splashColor,
                                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 80),
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 5,
                                    backgroundColor: Theme.of(context).backgroundColor,
                                    valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            errorWidget: (context, url, error)=> Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).splashColor,
                                borderRadius: const BorderRadius.all(Radius.circular(22)),
                              ),
                              child: Text(
                                S.of(context).error_text,
                                style: const TextStyle(
                                    fontFamily: 'SFProBold',
                                    fontSize: 20
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        height: 20,
                        width: 44,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Theme.of(context).primaryColor),
                            borderRadius: const BorderRadius.all(Radius.circular(10))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                                CupertinoIcons.camera_fill,
                                size: 13,
                                color: Theme.of(context).primaryColor
                            ),
                            const SizedBox(width: 5.67,),
                            Text(
                              '${selectedIndex+1}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              Text(
                S.of(context).address_text,
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
                S.of(context).operating_mode_text,
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
                        onTap: () => sendProvider.comToInt(widget.model.linkToTheInt),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 40,
                          width: 40,
                          child: Image.asset('assets/images/Frame 130.png'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => sendProvider.comToVk(widget.model.linkToTheVk),
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
                  GestureDetector(
                    onTap: () => sendProvider.comToEmail(),
                    child: Text(
                      S.of(context).complain_text,
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontSize: 16,
                        fontFamily: 'SFProLight'
                    ),
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
                            sendProvider.makePhoneCall('tel:${widget.model.phoneNumber}');
                          });
                        },
                        child: Text(
                          S.of(context).to_book_text,
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
}