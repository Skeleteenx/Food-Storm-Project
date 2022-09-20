import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_check_box.dart';

class ButtonsProvider extends ChangeNotifier {
  showModalSheet(BuildContext context) {
    return showModalBottomSheet(
      clipBehavior: Clip.hardEdge,
      backgroundColor: Colors.white,
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
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(15))
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
                          Text('Выберите город',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'SFProBold'
                            ),
                          ),
                          SizedBox(height: 24,),
                          Row(
                            children: [
                              CustomCheckBox(),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text('Тольятти', style: TextStyle(fontFamily: 'SFProLight', fontSize: 16),),
                              )
                            ],
                          ),
                          SizedBox(height: 16,),
                          Row(
                            children: [
                              CustomCheckBox(),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                  borderRadius: BorderRadius.all(Radius.circular(11))
                              ),
                              child: TextButton(
                                onPressed: (){},
                                child: Text('Готово', style: TextStyle(color: Colors.white, fontFamily: 'SFPro', fontSize: 13),),),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                  // child: Row(
                  //   children: [
                  //     Expanded(
                  //       child: ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.pop(context);
                  //           // pickingImage(false);
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.black,
                  //           onPrimary: Colors.white,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(16.0),
                  //           ),
                  //         ),
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(vertical: 13.0),
                  //           child: Text('Memory'),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 15.0,
                  //     ),
                  //     Expanded(
                  //       child: ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.pop(context);
                  //           // pickingImage(true);
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.black,
                  //           onPrimary: Colors.white,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(16.0),
                  //           ),
                  //         ),
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(vertical: 13.0),
                  //           child: Text('Camera'),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
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
      checkColor: Colors.white,
      shape: CircleBorder(),
      onChanged: (bool? value){
        setState((){
          isChecked = value!;
        });
      },
      value: isChecked,
    );
  }
}
