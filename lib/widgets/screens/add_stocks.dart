import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import '../../provider/add_image_in_storage_provider.dart';
import '../../provider/send_message_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../helpers/constants.dart';
import '../../generated/l10n.dart';

class AddStocks extends StatefulWidget {
  const AddStocks({Key? key}) : super(key: key);

  @override
  State<AddStocks> createState() => _AddStocksState();
}

class _AddStocksState extends State<AddStocks> {
  TextEditingController _deadControllerStart = TextEditingController();
  TextEditingController _deadControllerEnd = TextEditingController();
  final TextEditingController _nameInstitutionController =
      TextEditingController();
  final TextEditingController _nameStocksController = TextEditingController();
  final TextEditingController _basicDescriptionController =
      TextEditingController();
  final TextEditingController _shortDescriptionController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool _validate1 = false;
  bool _validate2 = false;
  bool _validate3 = false;
  bool _validate4 = false;
  bool _validate5 = false;
  bool _validate6 = false;
  bool _validate7 = false;
  bool _validate8 = false;

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
    AddImageInStorageProvider().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addImage = Provider.of<AddImageInStorageProvider>(context);
    final messProvider = Provider.of<SendMessageProvider>(context);
    return Scaffold(
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).add_stock_screen_text,
                  style: ConstantsTextStyle.h1,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  S.of(context).info_add_stock_screen_text,
                  style: ConstantsTextStyle.h3,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Text(
                  S.of(context).name_inst_text,
                  style: ConstantsTextStyle.h2,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
                  controller: _nameInstitutionController,
                  decoration: ConstantsTextStyle.DecorationForTextField(
                    S.of(context).enter_a_name_text,
                    _validate1,
                    S.of(context).empty_field_text,
                    context,
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  S.of(context).name_stock_text,
                  style: ConstantsTextStyle.h2,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(60),
                  ],
                  minLines: 1,
                  maxLines: 5,
                  controller: _nameStocksController,
                  decoration: ConstantsTextStyle.DecorationForTextField(
                    S.of(context).enter_a_name_text,
                    _validate2,
                    S.of(context).empty_field_text,
                    context,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  S.of(context).short_description_stock_text,
                  style: ConstantsTextStyle.h2,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(75),
                  ],
                  controller: _shortDescriptionController,
                  minLines: 1,
                  maxLines: 2,
                  decoration: ConstantsTextStyle.DecorationForTextField(
                    S.of(context).enter_a_desc_text,
                    _validate3,
                    S.of(context).empty_field_text,
                    context,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  S.of(context).main_description_stock_text,
                  style: ConstantsTextStyle.h2,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: _basicDescriptionController,
                  minLines: 10,
                  maxLines: 20,
                  decoration: ConstantsTextStyle.DecorationForTextField(
                    S.of(context).enter_a_desc_text,
                    _validate4,
                    S.of(context).empty_field_text,
                    context,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  S.of(context).date_start_text,
                  style: ConstantsTextStyle.h2,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  readOnly: true,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                  validator: (input) =>
                      input!.length < 3 ? S.of(context).date_start_text : null,
                  onTap: () => messProvider.showPickerDateStart(context).then(
                    (context) {
                      _deadControllerStart = TextEditingController(
                        text: messProvider.getDeadlineStart,
                      );
                    },
                  ),
                  controller: _deadControllerStart,
                  decoration: ConstantsTextStyle.DecorationForTextField(
                    S.of(context).choose_date_text,
                    _validate5,
                    S.of(context).empty_field_text,
                    context,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  S.of(context).date_end_text,
                  style: ConstantsTextStyle.h2,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  readOnly: true,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                  validator: (inputTwo) =>
                      inputTwo!.length < 3 ? S.of(context).date_end_text : null,
                  onTap: () => messProvider.showPickerDateEnd(context).then(
                    (context) {
                      _deadControllerEnd = TextEditingController(
                        text: messProvider.getDeadlineEnd,
                      );
                    },
                  ),
                  controller: _deadControllerEnd,
                  decoration: ConstantsTextStyle.DecorationForTextField(
                    S.of(context).choose_date_text,
                    _validate6,
                    S.of(context).empty_field_text,
                    context,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  S.of(context).photo_text,
                  style: ConstantsTextStyle.h2,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                GestureDetector(
                  onTap: () {
                    addImage.showModalSheet(context);
                  },
                  child: SizedBox(
                    height: 164.0,
                    child: addImage.image == null
                        ? Container(
                            width: 158.0,
                            height: 144.0,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(18, 18, 29, 210),
                              borderRadius: BorderRadius.all(
                                Radius.circular(11.0),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  CupertinoIcons.photo_camera,
                                  size: 32.0,
                                ),
                                Text(
                                  S.of(context).add_text,
                                ),
                              ],
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(11.0),
                            child: Image.file(
                              width: 158.0,
                              height: 144.0,
                              addImage.image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  S.of(context).telephone_manager_text,
                  style: ConstantsTextStyle.h2,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    MaskedInputFormatter(ConstantsKeys.textFormat),
                  ],
                  controller: _phoneNumberController,
                  decoration: ConstantsTextStyle.DecorationForTextField(
                    S.of(context).enter_phone_number_text,
                    _validate7,
                    S.of(context).empty_field_text,
                    context,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  S.of(context).email_text,
                  style: ConstantsTextStyle.h2,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(34),
                  ],
                  controller: _emailController,
                  decoration: ConstantsTextStyle.DecorationForTextField(
                    S.of(context).enter_email_text,
                    _validate8,
                    S.of(context).empty_field_text,
                    context,
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 42.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(11.0),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (_nameInstitutionController.text.isEmpty ||
                            _nameStocksController.text.isEmpty ||
                            _basicDescriptionController.text.isEmpty ||
                            _shortDescriptionController.text.isEmpty ||
                            _deadControllerEnd.text.isEmpty ||
                            _deadControllerStart.text.isEmpty ||
                            _emailController.text.isEmpty ||
                            _phoneNumberController.text.isEmpty) {
                          return setState(
                            () {
                              _nameInstitutionController.text.isEmpty
                                  ? _validate1 = true
                                  : _validate1 = false;
                              _nameStocksController.text.isEmpty
                                  ? _validate2 = true
                                  : _validate2 = false;
                              _basicDescriptionController.text.isEmpty
                                  ? _validate3 = true
                                  : _validate3 = false;
                              _shortDescriptionController.text.isEmpty
                                  ? _validate4 = true
                                  : _validate4 = false;
                              _deadControllerStart.text.isEmpty
                                  ? _validate5 = true
                                  : _validate5 = false;
                              _deadControllerEnd.text.isEmpty
                                  ? _validate6 = true
                                  : _validate6 = false;
                              _phoneNumberController.text.isEmpty
                                  ? _validate7 = true
                                  : _validate7 = false;
                              _emailController.text.isEmpty
                                  ? _validate8 = true
                                  : _validate8 = false;
                            },
                          );
                        } else {
                          addImage.addImageInStorage();
                          setState(
                            () {
                              _nameInstitutionController.text.isEmpty
                                  ? _validate1 = true
                                  : _validate1 = false;
                              _nameStocksController.text.isEmpty
                                  ? _validate2 = true
                                  : _validate2 = false;
                              _basicDescriptionController.text.isEmpty
                                  ? _validate3 = true
                                  : _validate3 = false;
                              _shortDescriptionController.text.isEmpty
                                  ? _validate4 = true
                                  : _validate4 = false;
                              _deadControllerStart.text.isEmpty
                                  ? _validate5 = true
                                  : _validate5 = false;
                              _deadControllerEnd.text.isEmpty
                                  ? _validate6 = true
                                  : _validate6 = false;
                              _phoneNumberController.text.isEmpty
                                  ? _validate7 = true
                                  : _validate7 = false;
                              _emailController.text.isEmpty
                                  ? _validate8 = true
                                  : _validate8 = false;
                            },
                          );
                          messProvider.sendEmail(
                            nameInstitution:
                                _nameInstitutionController.text.trim(),
                            nameStocks: _nameStocksController.text.trim(),
                            basicDescription:
                                _basicDescriptionController.text.trim(),
                            shortDescription:
                                _shortDescriptionController.text.trim(),
                            startDate: _deadControllerStart.text.trim(),
                            endDate: _deadControllerEnd.text.trim(),
                            email: _emailController.text.trim(),
                            phoneNumber: _phoneNumberController.text.trim(),
                            context: context,
                          );
                        }
                      },
                      child: Text(
                        S.of(context).to_send_text,
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
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 61.0,
            horizontal: 27.0,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
