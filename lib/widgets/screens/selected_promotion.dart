import 'package:cached_network_image/cached_network_image.dart';
import '../../provider/send_message_provider.dart';
import '../../provider/favorites_provider.dart';
import '../../models/target_promo_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helpers/constants.dart';
import '../../generated/l10n.dart';

// ignore: must_be_immutable
class SelectedPromoWidgetInPromo extends StatefulWidget {
  SelectedPromoWidgetInPromo({super.key, required this.model});
  TargetPromoModel model;

  @override
  State<SelectedPromoWidgetInPromo> createState() =>
      _SelectedPromoWidgetInPromoState();
}

class _SelectedPromoWidgetInPromoState
    extends State<SelectedPromoWidgetInPromo> {
  int selectedIndex = 0;

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
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
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
                      widget.model.shortAddress,
                      widget.model.linkToTheInt,
                      widget.model.linkToTheVk,
                      widget.model.tags,
                      widget.model.urlPhotos,
                    );
                  },
                  icon: Icon(
                    Icons.favorite,
                    size: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
            flexibleSpace: CachedNetworkImage(
              imageUrl: widget.model.image,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                color: Theme.of(context).splashColor,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  strokeWidth: 5.0,
                  backgroundColor: Theme.of(context).backgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: Theme.of(context).splashColor,
                alignment: Alignment.center,
                child: Text(
                  S.of(context).error_text,
                  style: TextStyle(
                    fontFamily: ConstantsFonts.boldFont,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            expandedHeight: 270.0,
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14.0,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 215.0,
                    child: Text(
                      widget.model.nameStocks,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: ConstantsFonts.boldFont,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                    ),
                    child: Container(
                      height: 32.0,
                      width: 72.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).splashColor,
                            spreadRadius: 0.1,
                            blurRadius: 3.0,
                          ),
                        ],
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(13.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.model.shareSize,
                          style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontSize: 19.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                'с ${widget.model.startDate} по ${widget.model.endDate}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).highlightColor,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 50.0,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.model.tags.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 3.0,
                    ),
                    height: 26.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).splashColor,
                          spreadRadius: 0.1,
                          blurRadius: 0.1,
                        ),
                      ],
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                      ),
                      child: Center(
                        child: Text(
                          widget.model.tags[index],
                          style: TextStyle(
                            fontFamily: ConstantsFonts.lightFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Theme.of(context).indicatorColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 77.0, 0.0),
                child: Text(
                  widget.model.basicDescription,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Container(
                color: Theme.of(context).focusColor,
                height: 1.0,
                width: double.maxFinite,
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                S.of(context).about_inst_text,
                style: TextStyle(
                  color: Theme.of(context).highlightColor,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.model.iconRes,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 42.0,
                      width: 42.0,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: imageProvider,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      height: 42.0,
                      width: 42.0,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      margin: const EdgeInsets.only(
                        left: 1.7,
                      ),
                      height: 42.0,
                      width: 42.0,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    widget.model.nameInstitution,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Icon(
                    Icons.star,
                    color: Theme.of(context).dividerColor,
                    size: 16.0,
                  ),
                  Text(
                    widget.model.resRating,
                    style: const TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                widget.model.informationAboutTheRest,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: ConstantsFonts.lightFont,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              SizedBox(
                height: 188.0,
                child: Stack(
                  children: [
                    PageView.builder(
                      onPageChanged: (value) => setState(
                        () {
                          selectedIndex = value;
                        },
                      ),
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
                              borderRadius: const BorderRadius.all(
                                Radius.circular(22.0),
                              ),
                            ),
                          ),
                          placeholder: (context, index) => Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).splashColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(22.0),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 150.0,
                                vertical: 80.0,
                              ),
                              height: 30.0,
                              width: 30.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 5.0,
                                backgroundColor:
                                    Theme.of(context).backgroundColor,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).splashColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(22.0),
                              ),
                            ),
                            child: Text(
                              S.of(context).error_text,
                              style: TextStyle(
                                fontFamily: ConstantsFonts.boldFont,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.all(16.0),
                        height: 20.0,
                        width: 44.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.camera_fill,
                              size: 13.0,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(
                              width: 5.67,
                            ),
                            Text(
                              '${selectedIndex + 1}',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                S.of(context).address_text,
                style: TextStyle(
                  color: Theme.of(context).highlightColor,
                  fontSize: 14.0,
                  fontFamily: ConstantsFonts.lightFont,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.location_solid,
                    color: Theme.of(context).backgroundColor,
                    size: 24.0,
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    widget.model.fullAddress,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: ConstantsFonts.lightFont,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28.0,
              ),
              Text(
                S.of(context).operating_mode_text,
                style: TextStyle(
                  color: Theme.of(context).highlightColor,
                  fontSize: 14.0,
                  fontFamily: ConstantsFonts.lightFont,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.time,
                    color: Theme.of(context).backgroundColor,
                    size: 24.0,
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    widget.model.operatingMode,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: ConstantsFonts.lightFont,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            sendProvider.comToInt(widget.model.linkToTheInt),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          height: 40.0,
                          width: 40.0,
                          child: Image.asset(ConstantsAssets.internetIcon),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            sendProvider.comToVk(widget.model.linkToTheVk),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          height: 40.0,
                          width: 40.0,
                          child: Center(
                            child: Image.asset(ConstantsAssets.vkIcon),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      sendProvider.comToEmail();
                    },
                    child: Text(
                      S.of(context).complain_text,
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontSize: 16.0,
                        fontFamily: ConstantsFonts.lightFont,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
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
                        onPressed: () => sendProvider.makePhoneCall(
                          'tel:${widget.model.phoneNumber}',
                        ),
                        child: Text(
                          S.of(context).to_book_text,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: ConstantsFonts.sfProFont,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
