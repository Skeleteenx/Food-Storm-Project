import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class ButtonsProvider extends ChangeNotifier {
  String selectedCity = 'Тольятти';
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
              height: 245,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).focusColor,
                            borderRadius: const BorderRadius.all(Radius.circular(15))
                        ),
                        height: 5,
                        width: 55,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 1),
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
                                    fontSize: 22,
                                    fontFamily: 'SFProBold'
                                ),
                              ),
                              const SizedBox(height: 24,),
                              Row(
                                children: [
                                  // CustomCheckBox(),
                                  SizedBox(
                                    height: 26,
                                    width: 26,
                                    child: Radio(
                                      activeColor: Theme.of(context).backgroundColor,
                                        value: S.of(context).tolyatti_text,
                                        groupValue: selectedCity,
                                        onChanged: (value) {
                                          setState((){
                                            selectedCity = value!;
                                            notifyListeners();
                                          });
                                        }
                                    ),
                                  ),
                                   Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      S.of(context).tolyatti_text,
                                      style: const TextStyle(
                                          fontFamily: 'SFProLight',
                                          fontSize: 16
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 16,),
                              Row(
                                children: [
                                  // CustomCheckBox(),
                                  SizedBox(
                                    height: 26,
                                    width: 26,
                                    child: Radio(
                                        activeColor: Theme.of(context).backgroundColor,
                                        value: S.of(context).samara_text,
                                        groupValue: selectedCity,
                                        onChanged: (value) {
                                          setState((){
                                            selectedCity = value!;
                                            notifyListeners();
                                          });
                                        }
                                    ),
                                  ),
                                   Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                        S.of(context).samara_text,
                                        style: const TextStyle(
                                            fontFamily: 'SFProLight',
                                            fontSize: 16
                                        )
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 32,),
                              SizedBox(
                                width: 332,
                                height: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: const BorderRadius.all(Radius.circular(11))
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      S.of(context).done_text,
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontFamily: 'SFPro',
                                          fontSize: 13
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
