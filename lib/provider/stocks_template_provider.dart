import 'package:cached_network_image/cached_network_image.dart';
import 'package:FoodStorm/provider/send_message_provider.dart';
import '../widgets/screens/selected_promotion.dart';
import 'package:FoodStorm/provider/favorites_provider.dart';
import '../models/target_promo_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helpers/constants.dart';
import '../generated/l10n.dart';

class StockTemplateProvider extends ChangeNotifier {
  GestureDetector stockTemplate(
    BuildContext context,
    String tempShortDescription,
    String tempEmail,
    String tempEndDate,
    String tempBasicDescription,
    String tempNameStocks,
    String tempNameInstitution,
    String tempStartDate,
    String tempPhoneNumber,
    String tempInformationAboutTheRest,
    String tempOperatingMode,
    String tempShareSize,
    String tempResRating,
    String tempImage,
    String tempIconRes,
    String tempFullAddress,
    String tempShortAddress,
    String tempLinkToTheInt,
    String tempLinkToTheVk,
    List<dynamic> tempTags,
    List<dynamic> tempUrlPhotos,
  ) {
    final favProvider = Provider.of<FavoritesProvider>(context);
    final sendProvider = Provider.of<SendMessageProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => SelectedPromoWidgetInPromo(
              model: TargetPromoModel(
                shortDescription: tempShortDescription,
                email: tempEmail,
                endDate: tempEndDate,
                basicDescription: tempBasicDescription,
                nameStocks: tempNameStocks,
                nameInstitution: tempNameInstitution,
                startDate: tempStartDate,
                phoneNumber: tempPhoneNumber,
                informationAboutTheRest: tempInformationAboutTheRest,
                operatingMode: tempOperatingMode,
                shareSize: tempShareSize,
                resRating: tempResRating,
                image: tempImage,
                iconRes: tempIconRes,
                fullAddress: tempFullAddress,
                shortAddress: tempShortAddress,
                linkToTheInt: tempLinkToTheInt,
                linkToTheVk: tempLinkToTheVk,
                tags: tempTags,
                urlPhotos: tempUrlPhotos,
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          height: 331.0,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).splashColor,
                spreadRadius: 5.0,
                blurRadius: 7.0,
                offset: const Offset(0.0, 2.0),
              ),
            ],
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: tempImage,
                imageBuilder: (context, imageProvider) => Container(
                  width: double.infinity,
                  height: 192.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14.0,
                                vertical: 14.0,
                              ),
                              child: Container(
                                height: 22.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).splashColor,
                                      spreadRadius: 5.0,
                                      blurRadius: 7.0,
                                      offset: const Offset(0.0, 2.0),
                                    ),
                                  ],
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(9.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Theme.of(context).dividerColor,
                                      size: 17.0,
                                    ),
                                    const SizedBox(
                                      width: 2.0,
                                    ),
                                    Text(
                                      tempResRating,
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 14.0,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).splashColor,
                                      spreadRadius: 5.0,
                                      blurRadius: 7.0,
                                      offset: const Offset(0.0, 2.0),
                                    )
                                  ],
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(11.0),
                                    topLeft: Radius.circular(11.0),
                                  ),
                                ),
                                height: 32.0,
                                width: 64.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      tempShareSize,
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).backgroundColor,
                                        fontSize: 20.0,
                                        fontFamily: ConstantsFonts.lightFont,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                placeholder: (context, url) => SizedBox(
                  height: 192.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).splashColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      strokeWidth: 5.0,
                      backgroundColor: Theme.of(context).backgroundColor,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => SizedBox(
                  height: 192.0,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).splashColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).failed_to_load,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: ConstantsFonts.lightFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 139.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: tempIconRes,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const CircularProgressIndicator(),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tempNameInstitution,
                                      style: TextStyle(
                                        color: Theme.of(context).canvasColor,
                                        fontSize: 20.0,
                                        fontFamily: ConstantsFonts.lightFont,
                                      ),
                                    ),
                                    Text(
                                      'с $tempStartDate по $tempEndDate',
                                      style: TextStyle(
                                        color: Theme.of(context).hintColor,
                                        fontSize: 14.0,
                                        fontFamily: ConstantsFonts.lightFont,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 42.0,
                                width: 42.0,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () async {
                                    favProvider.addStockToFav(
                                      context,
                                      tempBasicDescription,
                                      tempShortDescription,
                                      tempEmail,
                                      tempEndDate,
                                      tempNameInstitution,
                                      tempNameStocks,
                                      tempStartDate,
                                      tempPhoneNumber,
                                      tempInformationAboutTheRest,
                                      tempOperatingMode,
                                      tempShareSize,
                                      tempResRating,
                                      tempImage,
                                      tempIconRes,
                                      tempFullAddress,
                                      tempShortAddress,
                                      tempLinkToTheInt,
                                      tempLinkToTheVk,
                                      tempTags,
                                      tempUrlPhotos,
                                    );
                                  },
                                  icon: Icon(
                                    CupertinoIcons.heart,
                                    size: 27.0,
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Container(
                                height: 42.0,
                                width: 42.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    sendProvider.makePhoneCall(
                                      'tel:$tempPhoneNumber',
                                    );
                                  },
                                  icon: Icon(
                                    CupertinoIcons.phone,
                                    size: 27.0,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 60.0, 0.0),
                        child: Text(
                          tempShortDescription,
                          style: TextStyle(
                            fontFamily: ConstantsFonts.lightFont,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
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
