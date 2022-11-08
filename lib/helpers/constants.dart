import 'package:flutter/material.dart';

class ConstantsKeys {
  static String imageRes = 'images/';
  static String stocks = 'stocks';
  static String selectedCity = 'Тольятти';
  static String togliatti = 'stocks';
  static String samara = 'samara';
  static String all = 'Все';
  static String stocksTags = 'tags';
  static String hiveStocks = 'stocks';
  static String serviceId = 'service_mhpjycp';
  static String templateId = 'template_gaxw47y';
  static String userId = 'ymqSAs_Rs33BGs9Vr';
  static String urlParse = 'https://api.emailjs.com/api/v1.0/email/send';
  static String urlEmail = 'mailto:foodstormtogliatti@gmail.com';
  static String ru = 'ru';
  static String emptyText = '';
  static String textFormat = '+# (###)-###-##-##';
  static List<String> categories = [
    'Все',
    'Фастфуд',
    'Бургеры',
    'Пицца',
    'Роллы',
    'Шаурма',
    'Комбо',
  ];
  static int selectedIndex = 0;
}

class ConstantsFonts {
  static String lightFont = 'SFProLight';
  static String boldFont = 'SFProBold';
  static String sfProFont = 'SFPro';
  static String semiBoldFont = 'SFProSemiBold';
  static String gilroyFont = 'Gilroy';
}

class ConstantsAssets {
  static String mapMarker = 'assets/images/map-marker-Filled.png';
  static String internetIcon = 'assets/images/Frame 130.png';
  static String vkIcon = 'assets/images/Frame 128.png';
}

class ConstantsTextStyle {
  static TextStyle h1 = TextStyle(
    fontFamily: ConstantsFonts.semiBoldFont,
    fontSize: 24.0,
    color: Colors.black,
  );

  static TextStyle h2 = TextStyle(
    fontSize: 16.0,
    fontFamily: ConstantsFonts.semiBoldFont,
    color: Colors.black,
  );

  static TextStyle h3 = TextStyle(
    fontSize: 14.0,
    fontFamily: ConstantsFonts.sfProFont,
    color: Colors.black45,
  );

  static TextStyle h4 = TextStyle(
    fontSize: 14.0,
    fontFamily: ConstantsFonts.sfProFont,
  );

  static TextStyle h5 = const TextStyle(
    fontSize: 14.0,
    color: Color.fromRGBO(60, 180, 110, 1),
  );

  static TextStyle errorTextStyle = TextStyle(
    fontSize: 12.0,
    fontFamily: ConstantsFonts.sfProFont,
    color: Colors.red,
  );

  static TextStyle greenText = TextStyle(
    fontSize: 16.0,
    fontFamily: ConstantsFonts.lightFont,
    color: const Color.fromRGBO(60, 180, 110, 1),
  );

  // ignore: non_constant_identifier_names
  static InputDecoration DecorationForTextField(
    String? hintText,
    bool validate,
    String textInput,
    BuildContext context,
  ) {
    return InputDecoration(
      errorText: validate ? textInput : null,
      errorStyle: ConstantsTextStyle.errorTextStyle,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 12.0,
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 14.0,
        color: Theme.of(context).indicatorColor,
        fontFamily: ConstantsFonts.lightFont,
      ),
      fillColor: Theme.of(context).focusColor,
      filled: true,
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }
}
