import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key? key}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
        setState((){
          isSelected = !isSelected;
        });
      },
      child: AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 600),
        height: 26,
        width: 26,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).indicatorColor,
          ),
          // color: isSelected ? Theme.of(context).backgroundColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: isSelected ? Center(
          child:  AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              // border: Border.all(
              //   color: isSelected ? Theme.of(context).backgroundColor : Colors.transparent,
              // ),
              color: isSelected ? Theme.of(context).backgroundColor : Colors.transparent,
              shape: BoxShape.circle,
            ),
          ) ,
        ) : null,
      ),
    );
  }
}
