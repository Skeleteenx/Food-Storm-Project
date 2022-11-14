// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `FoodStorm`
  String get app_name_text {
    return Intl.message(
      'FoodStorm',
      name: 'app_name_text',
      desc: '',
      args: [],
    );
  }

  /// `Add a promotion`
  String get add_stock_text {
    return Intl.message(
      'Add a promotion',
      name: 'add_stock_text',
      desc: '',
      args: [],
    );
  }

  /// `Tolyatti`
  String get tolyatti_text {
    return Intl.message(
      'Tolyatti',
      name: 'tolyatti_text',
      desc: '',
      args: [],
    );
  }

  /// `Samara`
  String get samara_text {
    return Intl.message(
      'Samara',
      name: 'samara_text',
      desc: '',
      args: [],
    );
  }

  /// `Stock Search`
  String get search_stocks_text {
    return Intl.message(
      'Stock Search',
      name: 'search_stocks_text',
      desc: '',
      args: [],
    );
  }

  /// `Failed to upload image`
  String get failed_to_load {
    return Intl.message(
      'Failed to upload image',
      name: 'failed_to_load',
      desc: '',
      args: [],
    );
  }

  /// `Stocks`
  String get stocks_tab_text {
    return Intl.message(
      'Stocks',
      name: 'stocks_tab_text',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map_tab_text {
    return Intl.message(
      'Map',
      name: 'map_tab_text',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get fav_tab_text {
    return Intl.message(
      'Favourites',
      name: 'fav_tab_text',
      desc: '',
      args: [],
    );
  }

  /// `Choose a city`
  String get choose_city_text {
    return Intl.message(
      'Choose a city',
      name: 'choose_city_text',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done_text {
    return Intl.message(
      'Done',
      name: 'done_text',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back_text {
    return Intl.message(
      'Back',
      name: 'back_text',
      desc: '',
      args: [],
    );
  }

  /// `Adding a promotion`
  String get add_stock_screen_text {
    return Intl.message(
      'Adding a promotion',
      name: 'add_stock_screen_text',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be empty`
  String get empty_field_text {
    return Intl.message(
      'This field cannot be empty',
      name: 'empty_field_text',
      desc: '',
      args: [],
    );
  }

  /// `If you are a restaurant manager and want to add a promotion, then please fill out and submit the form below. It's free.`
  String get info_add_stock_screen_text {
    return Intl.message(
      'If you are a restaurant manager and want to add a promotion, then please fill out and submit the form below. It\'s free.',
      name: 'info_add_stock_screen_text',
      desc: '',
      args: [],
    );
  }

  /// `Name of the institution`
  String get name_inst_text {
    return Intl.message(
      'Name of the institution',
      name: 'name_inst_text',
      desc: '',
      args: [],
    );
  }

  /// `Name of the promotion`
  String get name_stock_text {
    return Intl.message(
      'Name of the promotion',
      name: 'name_stock_text',
      desc: '',
      args: [],
    );
  }

  /// `Brief description of the promotion`
  String get short_description_stock_text {
    return Intl.message(
      'Brief description of the promotion',
      name: 'short_description_stock_text',
      desc: '',
      args: [],
    );
  }

  /// `Basic description of the promotion`
  String get main_description_stock_text {
    return Intl.message(
      'Basic description of the promotion',
      name: 'main_description_stock_text',
      desc: '',
      args: [],
    );
  }

  /// `Start date`
  String get date_start_text {
    return Intl.message(
      'Start date',
      name: 'date_start_text',
      desc: '',
      args: [],
    );
  }

  /// `End date`
  String get date_end_text {
    return Intl.message(
      'End date',
      name: 'date_end_text',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get photo_text {
    return Intl.message(
      'Photo',
      name: 'photo_text',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add_text {
    return Intl.message(
      'Add',
      name: 'add_text',
      desc: '',
      args: [],
    );
  }

  /// `Manager's phone number`
  String get telephone_manager_text {
    return Intl.message(
      'Manager\'s phone number',
      name: 'telephone_manager_text',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email_text {
    return Intl.message(
      'E-mail',
      name: 'email_text',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get to_send_text {
    return Intl.message(
      'Send',
      name: 'to_send_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter a name`
  String get enter_a_name_text {
    return Intl.message(
      'Enter a name',
      name: 'enter_a_name_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter a description`
  String get enter_a_desc_text {
    return Intl.message(
      'Enter a description',
      name: 'enter_a_desc_text',
      desc: '',
      args: [],
    );
  }

  /// `Select a date`
  String get choose_date_text {
    return Intl.message(
      'Select a date',
      name: 'choose_date_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enter_phone_number_text {
    return Intl.message(
      'Enter your phone number',
      name: 'enter_phone_number_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter your e-mail`
  String get enter_email_text {
    return Intl.message(
      'Enter your e-mail',
      name: 'enter_email_text',
      desc: '',
      args: [],
    );
  }

  /// `Selected promotions are displayed here.`
  String get thirst_fav_info_text {
    return Intl.message(
      'Selected promotions are displayed here.',
      name: 'thirst_fav_info_text',
      desc: '',
      args: [],
    );
  }

  /// `Click on the heart to add a promotion`
  String get second_fav_info_text {
    return Intl.message(
      'Click on the heart to add a promotion',
      name: 'second_fav_info_text',
      desc: '',
      args: [],
    );
  }

  /// `to “Favorites“.`
  String get third_fav_info_text {
    return Intl.message(
      'to “Favorites“.',
      name: 'third_fav_info_text',
      desc: '',
      args: [],
    );
  }

  /// `Go to Stocks`
  String get go_to_stocks_text {
    return Intl.message(
      'Go to Stocks',
      name: 'go_to_stocks_text',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear_text {
    return Intl.message(
      'Clear',
      name: 'clear_text',
      desc: '',
      args: [],
    );
  }

  /// `About the restaurant`
  String get about_inst_text {
    return Intl.message(
      'About the restaurant',
      name: 'about_inst_text',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address_text {
    return Intl.message(
      'Address',
      name: 'address_text',
      desc: '',
      args: [],
    );
  }

  /// `Operating mode`
  String get operating_mode_text {
    return Intl.message(
      'Operating mode',
      name: 'operating_mode_text',
      desc: '',
      args: [],
    );
  }

  /// `Complain`
  String get complain_text {
    return Intl.message(
      'Complain',
      name: 'complain_text',
      desc: '',
      args: [],
    );
  }

  /// `To book`
  String get to_book_text {
    return Intl.message(
      'To book',
      name: 'to_book_text',
      desc: '',
      args: [],
    );
  }

  /// `This promotion is already in favorites.`
  String get already_have_text {
    return Intl.message(
      'This promotion is already in favorites.',
      name: 'already_have_text',
      desc: '',
      args: [],
    );
  }

  /// `The promotion has been added to favorites.`
  String get stock_added_text {
    return Intl.message(
      'The promotion has been added to favorites.',
      name: 'stock_added_text',
      desc: '',
      args: [],
    );
  }

  /// `The promotion has been removed from favorites.`
  String get removed_stock_text {
    return Intl.message(
      'The promotion has been removed from favorites.',
      name: 'removed_stock_text',
      desc: '',
      args: [],
    );
  }

  /// `All shares have been removed from favorites.`
  String get all_stocks_removed {
    return Intl.message(
      'All shares have been removed from favorites.',
      name: 'all_stocks_removed',
      desc: '',
      args: [],
    );
  }

  /// `Choose a method`
  String get choose_method_text {
    return Intl.message(
      'Choose a method',
      name: 'choose_method_text',
      desc: '',
      args: [],
    );
  }

  /// `From the gallery`
  String get from_gallery_text {
    return Intl.message(
      'From the gallery',
      name: 'from_gallery_text',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera_text {
    return Intl.message(
      'Camera',
      name: 'camera_text',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes_text {
    return Intl.message(
      'Yes',
      name: 'yes_text',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no_text {
    return Intl.message(
      'No',
      name: 'no_text',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error_text {
    return Intl.message(
      'Error',
      name: 'error_text',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm`
  String get confirm_text {
    return Intl.message(
      'Please confirm',
      name: 'confirm_text',
      desc: '',
      args: [],
    );
  }

  /// `The application has been sent successfully.`
  String get stock_on_block_text {
    return Intl.message(
      'The application has been sent successfully.',
      name: 'stock_on_block_text',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete all the shares from your favorites?`
  String get sure_confirm_text {
    return Intl.message(
      'Are you sure you want to delete all the shares from your favorites?',
      name: 'sure_confirm_text',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
