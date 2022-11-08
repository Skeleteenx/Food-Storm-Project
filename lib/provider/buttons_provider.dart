import 'package:FoodStorm/helpers/constants.dart';
import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class ButtonsProvider extends ChangeNotifier {
  String selectedCity = ConstantsKeys.selectedCity;

  showModalSheet(BuildContext context) {
    return showModalBottomSheet(
      clipBehavior: Clip.hardEdge,
      backgroundColor: Theme.of(context).primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              width: double.infinity,
              height: 245.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).focusColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        height: 5.0,
                        width: 55.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).choose_city_text,
                                style: TextStyle(
                                  color: Theme.of(context).canvasColor,
                                  fontSize: 22.0,
                                  fontFamily: ConstantsFonts.boldFont,
                                ),
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 26.0,
                                    width: 26.0,
                                    child: Radio(
                                      activeColor:
                                          Theme.of(context).backgroundColor,
                                      value: S.of(context).tolyatti_text,
                                      groupValue: selectedCity,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            selectedCity = value!;
                                            notifyListeners();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Text(
                                      S.of(context).tolyatti_text,
                                      style: TextStyle(
                                        fontFamily: ConstantsFonts.lightFont,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 26.0,
                                    width: 26.0,
                                    child: Radio(
                                      activeColor:
                                          Theme.of(context).backgroundColor,
                                      value: S.of(context).samara_text,
                                      groupValue: selectedCity,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            selectedCity = value!;
                                            notifyListeners();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Text(
                                      S.of(context).samara_text,
                                      style: TextStyle(
                                        fontFamily: ConstantsFonts.lightFont,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 32.0,
                              ),
                              SizedBox(
                                width: 332.0,
                                height: 40.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(11.0),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      S.of(context).done_text,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontFamily: ConstantsFonts.sfProFont,
                                        fontSize: 13.0,
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
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
