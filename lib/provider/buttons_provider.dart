import 'package:flutter/material.dart';
import '../custom_widgets/custom_check_box.dart';

class ButtonsProvider extends ChangeNotifier {
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
        return SizedBox(
          width: double.infinity,
          height: 245,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                            'Выберите город',
                            style: TextStyle(
                                color: Theme.of(context).canvasColor,
                                fontSize: 22,
                                fontFamily: 'SFProBold'
                            ),
                          ),
                          const SizedBox(height: 24,),
                          Row(
                            children: const[
                               CustomCheckBox(),
                               Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text('Тольятти', style: TextStyle(fontFamily: 'SFProLight', fontSize: 16),),
                              )
                            ],
                          ),
                          const SizedBox(height: 16,),
                          Row(
                            children: const[
                              CustomCheckBox(),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text('Самара', style: TextStyle(fontFamily: 'SFProLight', fontSize: 16)),
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
                                onPressed: (){},
                                child: Text(
                                  'Готово',
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
  }
}

class IsChecked extends StatefulWidget {
  const IsChecked({Key? key}) : super(key: key);

  @override
  State<IsChecked> createState() => _IsCheckedState();
}

class _IsCheckedState extends State<IsChecked> {

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Theme.of(context).primaryColor,
      shape: const CircleBorder(),
      onChanged: (bool? value){
        setState((){
          isChecked = value!;
        });
      },
      value: isChecked,
    );
  }
}
