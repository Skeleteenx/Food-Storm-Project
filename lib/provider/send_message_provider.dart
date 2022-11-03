import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../generated/l10n.dart';

class SendMessageProvider extends ChangeNotifier {
  File? image;
  String? imageUrl;
  bool buttonState = false;
  String deadlineOne = '';
  String deadlineTwo = '';

  get getDeadlineStart => deadlineOne;
  get getDeadlineEnd => deadlineTwo;

  Future pickingImage() async {
    try {
      final image = await ImagePicker().pickImage(
        // source: camera == true ? ImageSource.camera : ImageSource.gallery,
        source: ImageSource.gallery,
      );
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      notifyListeners();
    } on PlatformException {
      return const SnackBar(
        content: Text('Ошибка'),
      );
    }
  }

  Future<List<int>?> showPickerDateStart(BuildContext context) {
    return Picker(
        looping: false,
        itemExtent: 38.0,
        hideHeader: true,
        adapter: DateTimePickerAdapter(),
        textAlign: TextAlign.center,
        confirmText: S.of(context).done_text,
        confirmTextStyle: TextStyle(color: Theme.of(context).backgroundColor),
        cancelTextStyle: TextStyle(color: Theme.of(context).backgroundColor),
        cancelText: S.of(context).back_text,
         title: Container(
           alignment: Alignment.center,
           child: Text(
             S.of(context).choose_date_text,
             style: const TextStyle(
               fontFamily: 'SFProSemibold',
               fontSize: 20.0,
             ),
           ),
         ),
        onConfirm: (Picker picker, List value) {
          DateTime? dateTime = (picker.adapter as DateTimePickerAdapter).value;
          String dateString = DateFormat.yMMMMd('ru').format(dateTime!);
          String timeString = DateFormat.jm('ru').format(dateTime);
          String finalTime = dateString + ' ' + timeString;
          deadlineOne = finalTime;
          notifyListeners();
        }).showDialog(context);
  }

  Future<List<int>?> showPickerDateEnd(BuildContext context) {
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
            style: const TextStyle(
              fontFamily: 'SFProSemibold',
              fontSize: 20.0,
            ),
          ),
        ),
        onConfirm: (Picker picker, List value) {
          DateTime? dateTime = (picker.adapter as DateTimePickerAdapter).value;
          String dateString = DateFormat.yMMMMd('ru').format(dateTime!);
          String timeString = DateFormat.jm('ru').format(dateTime);
          String finalTimeSec = dateString + ' ' + timeString;
          deadlineTwo = finalTimeSec;
          notifyListeners();
        }).showDialog(context);
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
    required BuildContext context
  }) async {
    const serviceId = 'service_mhpjycp';
    const templateId = 'template_gaxw47y';
    const userId = 'ymqSAs_Rs33BGs9Vr';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode ({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
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
            'res_rating': resRating
          }
      })
    ).whenComplete(
            () => ScaffoldMessenger
            .of(context)
            .showSnackBar(
            SnackBar(
                duration: const Duration(milliseconds: 3000),
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).stock_on_block_text,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SFProLight',
                          color: Theme.of(context).canvasColor
                      ),
                    ),
                  ],
                )
            )
        )
    ).whenComplete(() => Navigator.pop(context));
}

  void comToEmail() async {
    String urlEmail = 'mailto:foodstormtogliatti@gmail.com';
    await launch(urlEmail);
  }

  void comToInt(String urlInt) async {
    await launch(urlInt);
  }

  void comToVk(String urlVk) async {
    await launch(urlVk);
  }

  Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}