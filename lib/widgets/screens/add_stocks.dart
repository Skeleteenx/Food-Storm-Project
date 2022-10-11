import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import '../../provider/send_message_provider.dart';

class AddStocks extends StatefulWidget {
  AddStocks({Key? key}) : super(key: key);

  @override
  State<AddStocks> createState() => _AddStocksState();
}

class _AddStocksState extends State<AddStocks> {

  TextEditingController _deadControllerStart = TextEditingController();
  TextEditingController _deadControllerEnd = TextEditingController();
  TextEditingController _nameInstitutionController = TextEditingController();
  TextEditingController _nameStocksController = TextEditingController();
  TextEditingController _basicDescriptionController = TextEditingController();
  TextEditingController _shortDescriptionController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _informationAboutTheRestController = TextEditingController();
  TextEditingController _operatingModeController = TextEditingController();

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
    _operatingModeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final textFieldStyle = TextStyle(
      height: 0.6
    );

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

    final messProvider = Provider.of<SendMessageProvider>(context);
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
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
                  SizedBox(height: 16,),
                  Text(
                      'Если вы менеджер ресторана и хотите добавить акцию, то пожалуйста заполните и отправьте форму ниже. Это бесплатно.',
                    style: h3
                  ),
                  SizedBox(height: 32,),
                  Text(
                    'Название заведения',
                    style: h2
                  ),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16)
                      ],
                      style: textFieldStyle,
                      controller: _nameInstitutionController,
                      decoration: InputDecoration(
                        labelText: 'Введите название',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).indicatorColor,
                            fontFamily: 'SFProLight'
                        ),
                        hintStyle: TextStyle(
                            color: Theme.of(context).indicatorColor
                        ),
                        fillColor: Theme.of(context).focusColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text('Название акции', style: h2,),
                  SizedBox(height: 8,),
                  SizedBox(
                    // height: 40,
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(60)
                      ],
                      minLines: 1,
                      maxLines: 5,
                      style: textFieldStyle,
                      controller: _nameStocksController,
                      decoration: InputDecoration(
                        labelText: 'Введите название',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).indicatorColor,
                            fontFamily: 'SFProLight'
                        ),
                        hintStyle: TextStyle(
                            color: Theme.of(context).indicatorColor
                        ),
                        fillColor: Theme.of(context).focusColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text('Краткое описание акции', style: h2,),
                  SizedBox(height: 8,),
                  TextFormField(

                    style: textFieldStyle,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(75)
                    ],
                    controller: _shortDescriptionController,
                    minLines: 2,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Введите описание',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).indicatorColor,
                          fontFamily: 'SFProLight'
                      ),
                      // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                      fillColor: Theme.of(context).focusColor,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text('Основное описание акции', style: h2,),
                  SizedBox(height: 8,),
                  TextField(
                    style: textFieldStyle,
                    controller: _basicDescriptionController,
                    minLines: 10,
                    maxLines: 20,
                    decoration: InputDecoration(
                      hintText: 'Введите описание',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).indicatorColor,
                          fontFamily: 'SFProLight'
                      ),
                      // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                      fillColor: Theme.of(context).focusColor,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text('Дата начала', style: h2),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      style: textFieldStyle,
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
                        suffixIcon: Icon(Icons.calendar_month),
                        labelText: 'Выберите дату',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).indicatorColor,
                            fontFamily: 'SFProLight'
                        ),
                        fillColor: Theme.of(context).focusColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                      'Дата окончания',
                      style: h2
                  ),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      style: textFieldStyle,
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
                        // suffixIcon: IconButton(
                        //     onPressed: (){
                        //       messProvider.showPickerDateStart(context);
                        //     },
                        //     icon: Icon(Icons.calendar_month)
                        // ),
                        suffixIcon: Icon(Icons.calendar_month),
                        // hintText: 'Выберите дату',
                        labelText: 'Выберите дату',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).indicatorColor,
                            fontFamily: 'SFProLight'
                        ),
                        // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                        fillColor: Theme.of(context).focusColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text(
                      'Фото',
                      style: h2
                  ),
                  SizedBox(height: 8,),
                  GestureDetector(
                    onTap: (){
                      messProvider.pickingImage();
                    },
                    child: SizedBox(
                      height: 164,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 158,
                            height: 144,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(18, 18, 29, 210),
                              borderRadius: BorderRadius.all(Radius.circular(11)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.photo_camera,
                                  size: 32
                                ),
                                Text('Добавить')
                              ],
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            width: 158,
                            height: 144,
                            decoration: BoxDecoration(
                              color: Theme.of(context).focusColor,
                              borderRadius: BorderRadius.all(Radius.circular(11)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Text(
                      'Телефон менеджера',
                      style: h2
                  ),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      style: textFieldStyle,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        MaskedInputFormatter('+# (###)-###-##-##')
                      ],
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        labelText: 'Введите номер телефона',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).indicatorColor,
                            fontFamily: 'SFProLight'
                        ),
                        hintStyle: TextStyle(
                            color: Theme.of(context).indicatorColor
                        ),
                        fillColor: Theme.of(context).focusColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text(
                      'E-mail',
                      style: h2
                  ),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(34)
                      ],
                      style: textFieldStyle,
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Введите ваш e-mail',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).indicatorColor,
                            fontFamily: 'SFProLight'
                        ),
                        // label: Text('Поиск по акциям', style: TextStyle(fontSize: 13, color: Colors.black38),),
                        hintStyle: TextStyle(
                            color: Theme.of(context).indicatorColor
                        ),
                        fillColor: Theme.of(context).focusColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32,),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(11))
                      ),
                      child: TextButton(
                        onPressed: (){
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
              icon: Icon(
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
        title: Text("Выберите дату"),
        onConfirm: (Picker picker, List value) {

          // print((picker.adapter as DateTimePickerAdapter).value);
        }).showDialog(context);
  }
}
