import 'package:FoodStorm/helpers/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../generated/l10n.dart';
import 'dart:convert';
import 'dart:io';

class SendMessageProvider extends ChangeNotifier {
  File? image;

  String? imageUrl;
  String deadlineOne = '';
  String deadlineTwo = '';

  bool buttonState = false;

  get getDeadlineStart => deadlineOne;
  get getDeadlineEnd => deadlineTwo;

  Future pickingImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      notifyListeners();
    } on PlatformException {
      return;
    }
  }

  Future<List<int>?> showPickerDateStart(
    BuildContext context,
  ) {
    return Picker(
      looping: false,
      itemExtent: 38.0,
      hideHeader: true,
      adapter: DateTimePickerAdapter(),
      textAlign: TextAlign.center,
      confirmText: S.of(context).done_text,
      confirmTextStyle: TextStyle(
        color: Theme.of(context).backgroundColor,
      ),
      cancelTextStyle: TextStyle(
        color: Theme.of(context).backgroundColor,
      ),
      cancelText: S.of(context).back_text,
      title: Container(
        alignment: Alignment.center,
        child: Text(
          S.of(context).choose_date_text,
          style: TextStyle(
            fontFamily: ConstantsFonts.semiBoldFont,
            fontSize: 20.0,
          ),
        ),
      ),
      onConfirm: (
        Picker picker,
        List value,
      ) {
        DateTime? dateTime = (picker.adapter as DateTimePickerAdapter).value;
        String dateString =
            DateFormat.yMMMMd(ConstantsKeys.ru).format(dateTime!);
        String timeString = DateFormat.jm(ConstantsKeys.ru).format(dateTime);
        String finalTime = dateString + ' ' + timeString;
        deadlineOne = finalTime;
        notifyListeners();
      },
    ).showDialog(context);
  }

  Future<List<int>?> showPickerDateEnd(
    BuildContext context,
  ) {
    return Picker(
      looping: false,
      itemExtent: 38.0,
      hideHeader: true,
      adapter: DateTimePickerAdapter(),
      textAlign: TextAlign.center,
      confirmText: S.of(context).done_text,
      cancelText: S.of(context).back_text,
      title: Container(
        alignment: Alignment.center,
        child: Text(
          S.of(context).choose_date_text,
          style: TextStyle(
            fontFamily: ConstantsFonts.semiBoldFont,
            fontSize: 20.0,
          ),
        ),
      ),
      onConfirm: (
        Picker picker,
        List value,
      ) {
        DateTime? dateTime = (picker.adapter as DateTimePickerAdapter).value;
        String dateString =
            DateFormat.yMMMMd(ConstantsKeys.ru).format(dateTime!);
        String timeString = DateFormat.jm(ConstantsKeys.ru).format(dateTime);
        String finalTimeSec = dateString + ' ' + timeString;
        deadlineTwo = finalTimeSec;
        notifyListeners();
      },
    ).showDialog(context);
  }

  Future sendEmail({
    nameInstitution,
    nameStocks,
    basicDescription,
    startDate,
    endDate,
    email,
    phoneNumber,
    shortDescription,
    informationAboutTheRest,
    operatingMode,
    shareSize,
    resRating,
    required BuildContext context,
  }) async {
    final url = Uri.parse(ConstantsKeys.urlParse);
    final _ = await http
        .post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(
            {
              'service_id': ConstantsKeys.serviceId,
              'template_id': ConstantsKeys.templateId,
              'user_id': ConstantsKeys.userId,
              'template_params': {
                'name_institution': nameInstitution,
                'name_stocks': nameStocks,
                'basic_description': basicDescription,
                'start_date': startDate,
                'end_date': endDate,
                'e_mail': email,
                'phone_number': phoneNumber,
                'short_description': shortDescription,
                'information_about_the_rest': informationAboutTheRest,
                'operating_mode': operatingMode,
                'share_size': shareSize,
                'res_rating': resRating,
              },
            },
          ),
        )
        .whenComplete(
          () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(
                milliseconds: 3000,
              ),
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).stock_on_block_text,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: ConstantsFonts.lightFont,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .whenComplete(
          () => Navigator.pop(context),
        );
  }

  Future<void> comToEmail() async {
    final uri = Uri.parse(ConstantsKeys.urlEmail);
    await launchUrl(uri);
  }

  Future<void> comToInt(
    String urlInt,
  ) async {
    final uri = Uri.parse(urlInt);
    await launchUrl(uri);
  }

  Future<void> comToVk(
    String urlVk,
  ) async {
    final uri = Uri.parse(urlVk);
    await launchUrl(uri);
  }

  Future<void> makePhoneCall(
    String url,
  ) async {
    final uri = Uri.parse(url);
    await launchUrl(uri);
  }
}
