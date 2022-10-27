
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import '../../provider/add_image_in_storage_provider.dart';
import '../../provider/send_message_provider.dart';

class AddStocks extends StatefulWidget {
  const AddStocks({Key? key}) : super(key: key);

  @override
  State<AddStocks> createState() => _AddStocksState();
}

class _AddStocksState extends State<AddStocks> {

  bool _validate1 = false;
  bool _validate2 = false;
  bool _validate3 = false;
  bool _validate4 = false;
  bool _validate5 = false;
  bool _validate6 = false;
  bool _validate7 = false;
  bool _validate8 = false;

  TextEditingController _deadControllerStart = TextEditingController();
  TextEditingController _deadControllerEnd = TextEditingController();
  final TextEditingController _nameInstitutionController = TextEditingController();
  final TextEditingController _nameStocksController = TextEditingController();
  final TextEditingController _basicDescriptionController = TextEditingController();
  final TextEditingController _shortDescriptionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _informationAboutTheRestController = TextEditingController();

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  void dispose() {
    _nameInstitutionController.dispose();
    _nameStocksController.dispose();
    _deadControllerEnd.dispose();
    _deadControllerStart.dispose();
    _basicDescriptionController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _informationAboutTheRestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h1 = TextStyle(
      fontFamily: 'SFProSemibold',
      fontSize: 24,
      color: Theme.of(context).canvasColor
    );

    final h2 = TextStyle(
        fontSize: 16,
        fontFamily: 'SFProSemibold',
        color: Theme.of(context).canvasColor
    );

    final h3 = TextStyle(
      fontSize: 14,
      fontFamily: 'SFPro',
      color: Theme.of(context).cardColor
    );

    final errorTextStyle = TextStyle(
      fontSize: 12,
      fontFamily: 'SFPro',
      color: Theme.of(context).toggleableActiveColor

    );

    final addImage = Provider.of<AddImageInStorageProvider>(context);
    final messProvider = Provider.of<SendMessageProvider>(context);
    return Scaffold(
      body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 80, 16, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      S.of(context).adding_a_promotion,
                      style: h1
                  ),
                  const SizedBox(height: 16,),
                  Text(
                      'Если вы менеджер ресторана и хотите добавить акцию, то пожалуйста заполните и отправьте форму ниже. Это бесплатно.',
                    style: h3
                  ),
                  const SizedBox(height: 32,),
                  Text(
                    'Название заведения',
                    style: h2
                  ),
                  const SizedBox(height: 8,),
                  TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16)
                    ],
                    controller: _nameInstitutionController,
                    decoration: InputDecoration(
                      errorText: _validate1 ? 'Это поле не может быть пустым' : null,
                      errorStyle: errorTextStyle,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                      hintText: 'Введите название',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).indicatorColor,
                          fontFamily: 'SFProLight'
                      ),
                      fillColor: Theme.of(context).focusColor,
                      filled: true,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Text(
                    'Название акции',
                    style: h2
                  ),
                  const SizedBox(height: 8,),
                  TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(60)
                    ],
                    minLines: 1,
                    maxLines: 5,
                    controller: _nameStocksController,
                    decoration: InputDecoration(
                      errorStyle: errorTextStyle,
                      errorText: _validate2 ? 'Это поле не может быть пустым' : null,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                      hintText: 'Введите название',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).indicatorColor,
                          fontFamily: 'SFProLight'
                      ),
                      fillColor: Theme.of(context).focusColor,
                      filled: true,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Text('Краткое описание акции', style: h2,),
                  const SizedBox(height: 8,),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(75)
                    ],
                    controller: _shortDescriptionController,
                    minLines: 1,
                    maxLines: 2,
                    decoration: InputDecoration(
                      errorStyle: errorTextStyle,
                      errorText: _validate3 ? 'Это поле не может быть пустым' : null,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                      hintText: 'Введите описание',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).indicatorColor,
                          fontFamily: 'SFProLight'
                      ),
                      // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                      fillColor: Theme.of(context).focusColor,
                      filled: true,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Text('Основное описание акции', style: h2,),
                  const SizedBox(height: 8,),
                  TextField(
                    controller: _basicDescriptionController,
                    minLines: 10,
                    maxLines: 20,
                    decoration: InputDecoration(
                      errorStyle: errorTextStyle,
                      errorText: _validate4 ? 'Это поле не может быть пустым' : null,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                      hintText: 'Введите описание',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).indicatorColor,
                          fontFamily: 'SFProLight'
                      ),
                      // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                      fillColor: Theme.of(context).focusColor,
                      filled: true,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Text('Дата начала', style: h2),
                  const SizedBox(height: 8,),
                  TextFormField(
                    readOnly: true,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    onSaved: (input){},
                    obscureText: false,
                    textInputAction: TextInputAction.done,
                    validator: (input) =>
                    input!.length < 3 ? S.of(context).add_stock : null,
                    onTap: () => messProvider.showPickerDateStart(context).then((context){
                      _deadControllerStart = TextEditingController(
                        text: messProvider.getDeadlineStart,
                      );
                    }),
                    controller: _deadControllerStart,
                    decoration: InputDecoration(
                      errorStyle: errorTextStyle,
                      errorText: _validate5 ? 'Это поле не может быть пустым' : null,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                      suffixIcon: const Icon(Icons.calendar_month,),
                      suffixIconColor: Theme.of(context).backgroundColor,
                      hintText: 'Выберите дату',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).indicatorColor,
                          fontFamily: 'SFProLight'
                      ),
                      // labelText: 'Выберите дату',
                      // labelStyle: TextStyle(
                      //     fontSize: 14,
                      //     color: Theme.of(context).indicatorColor,
                      //     fontFamily: 'SFProLight'
                      // ),
                      fillColor: Theme.of(context).focusColor,
                      filled: true,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                      'Дата окончания',
                      style: h2
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    readOnly: true,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    onSaved: (inputTwo){},
                    obscureText: false,
                    textInputAction: TextInputAction.done,
                    validator: (inputTwo) =>
                    inputTwo!.length < 3 ? S.of(context).cup_bar_map : null,
                    onTap: () => messProvider
                        .showPickerDateEnd(context)
                        .then((context){
                      _deadControllerEnd = TextEditingController(
                        text: messProvider.getDeadlineEnd,
                      );
                    }),
                    controller: _deadControllerEnd,
                    decoration: InputDecoration(
                      errorStyle: errorTextStyle,
                      errorText: _validate6 ? 'Это поле не может быть пустым' : null,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                      suffixIcon: const Icon(Icons.calendar_month),
                      hintText: 'Выберите дату',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).indicatorColor,
                          fontFamily: 'SFProLight'
                      ),
                      fillColor: Theme.of(context).focusColor,
                      filled: true,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Text(
                      'Фото',
                      style: h2
                  ),
                  const SizedBox(height: 8,),
                  GestureDetector(
                    onTap: () async {
                      await addImage.showModalSheet(context);
                      // messProvider.pickingImage();
                    },
                    child: SizedBox(
                      height: 164,
                      child: addImage.image == null
                          ? Container(
                        width: 158,
                        height: 144,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(18, 18, 29, 210),
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                                CupertinoIcons.photo_camera,
                                size: 32
                            ),
                            Text('Добавить')
                          ],
                        ),
                      ) : ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: Image.file(
                          width: 158,
                          height: 144,
                          addImage.image!,
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Text(
                      'Телефон менеджера',
                      style: h2
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      MaskedInputFormatter('+# (###)-###-##-##')
                    ],
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      errorStyle: errorTextStyle,
                      errorText: _validate7 ? 'Это поле не может быть пустым' : null,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                      hintText: 'Введите номер телефона',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).indicatorColor,
                          fontFamily: 'SFProLight'
                      ),
                      fillColor: Theme.of(context).focusColor,
                      filled: true,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Text(
                      'E-mail',
                      style: h2
                  ),
                  const SizedBox(height: 8,),
                  TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(34)
                    ],
                    controller: _emailController,
                    decoration: InputDecoration(
                      errorStyle: errorTextStyle,
                      errorText: _validate8 ? 'Это поле не может быть пустым' : null,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                      hintText: 'Введите ваш e-mail',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).indicatorColor,
                          fontFamily: 'SFProLight'
                      ),
                      fillColor: Theme.of(context).focusColor,
                      filled: true,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                  const SizedBox(height: 32,),
                  SizedBox(
                    width: double.infinity,
                    height: 42,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: const BorderRadius.all(Radius.circular(11))
                      ),
                      child: TextButton(
                        onPressed: () async {
                            messProvider.sendEmail(
                              nameInstitution: _nameInstitutionController.text.trim(),
                              nameStocks: _nameStocksController.text.trim(),
                              basicDescription: _basicDescriptionController.text.trim(),
                              shortDescription: _shortDescriptionController.text.trim(),
                              startDate: _deadControllerStart.text.trim(),
                              endDate: _deadControllerEnd.text.trim(),
                              email: _emailController.text.trim(),
                              phoneNumber: _phoneNumberController.text.trim(),
                            );
                          setState(() {
                            _nameInstitutionController.text.isEmpty ? _validate1 = true : _validate1 = false;
                            _nameStocksController.text.isEmpty ? _validate2 = true : _validate2 = false;
                            _basicDescriptionController.text.isEmpty ? _validate3 = true : _validate3 = false;
                            _shortDescriptionController.text.isEmpty ? _validate4 = true : _validate4 = false;
                            _deadControllerStart.text.isEmpty ? _validate5 = true : _validate5 = false;
                            _deadControllerEnd.text.isEmpty ? _validate6 = true : _validate6 = false;
                            _emailController.text.isEmpty ? _validate7 = true : _validate7 = false;
                            _phoneNumberController.text.isEmpty ? _validate8 = true : _validate8 = false;
                          });
                          await addImage.addImageInStorage();
                        },
                        child: Text(
                          'Отправить',
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
            )
          ]
      ),
      floatingActionButton: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 61, horizontal: 27),
          child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
              )
          ),
        ),
      ),
    );
  }

  showPickerDate(BuildContext context) {
    Picker(
        hideHeader: true,
        adapter: DateTimePickerAdapter(),
        title: const Text("Выберите дату"),
        onConfirm: (Picker picker, List value){}).showDialog(context);
  }
}
