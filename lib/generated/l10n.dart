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

  /// `Food Storm`
  String get app_name_text {
    return Intl.message(
      'Food Storm',
      name: 'app_name_text',
      desc: '',
      args: [],
    );
  }

  /// `Добавить акцию`
  String get add_stock_text {
    return Intl.message(
      'Добавить акцию',
      name: 'add_stock_text',
      desc: '',
      args: [],
    );
  }

  /// `Тольятти`
  String get tolyatti_text {
    return Intl.message(
      'Тольятти',
      name: 'tolyatti_text',
      desc: '',
      args: [],
    );
  }

  /// `Самара`
  String get samara_text {
    return Intl.message(
      'Самара',
      name: 'samara_text',
      desc: '',
      args: [],
    );
  }

  /// `Поиск по акциям`
  String get search_stocks_text {
    return Intl.message(
      'Поиск по акциям',
      name: 'search_stocks_text',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось загрузить изображение`
  String get failed_to_load {
    return Intl.message(
      'Не удалось загрузить изображение',
      name: 'failed_to_load',
      desc: '',
      args: [],
    );
  }

  /// `Акции`
  String get stocks_tab_text {
    return Intl.message(
      'Акции',
      name: 'stocks_tab_text',
      desc: '',
      args: [],
    );
  }

  /// `Карта`
  String get map_tab_text {
    return Intl.message(
      'Карта',
      name: 'map_tab_text',
      desc: '',
      args: [],
    );
  }

  /// `Избранное`
  String get fav_tab_text {
    return Intl.message(
      'Избранное',
      name: 'fav_tab_text',
      desc: '',
      args: [],
    );
  }

  /// `Выберите город`
  String get choose_city_text {
    return Intl.message(
      'Выберите город',
      name: 'choose_city_text',
      desc: '',
      args: [],
    );
  }

  /// `Готово`
  String get done_text {
    return Intl.message(
      'Готово',
      name: 'done_text',
      desc: '',
      args: [],
    );
  }

  /// `Назад`
  String get back_text {
    return Intl.message(
      'Назад',
      name: 'back_text',
      desc: '',
      args: [],
    );
  }

  /// `Добавление акции`
  String get add_stock_screen_text {
    return Intl.message(
      'Добавление акции',
      name: 'add_stock_screen_text',
      desc: '',
      args: [],
    );
  }

  /// `Это поле не может быть пустым`
  String get empty_field_text {
    return Intl.message(
      'Это поле не может быть пустым',
      name: 'empty_field_text',
      desc: '',
      args: [],
    );
  }

  /// `Если вы менеджер ресторана и хотите добавить акцию, то пожалуйста заполните и отправьте форму ниже. Это бесплатно.`
  String get info_add_stock_screen_text {
    return Intl.message(
      'Если вы менеджер ресторана и хотите добавить акцию, то пожалуйста заполните и отправьте форму ниже. Это бесплатно.',
      name: 'info_add_stock_screen_text',
      desc: '',
      args: [],
    );
  }

  /// `Название заведения`
  String get name_inst_text {
    return Intl.message(
      'Название заведения',
      name: 'name_inst_text',
      desc: '',
      args: [],
    );
  }

  /// `Название акции`
  String get name_stock_text {
    return Intl.message(
      'Название акции',
      name: 'name_stock_text',
      desc: '',
      args: [],
    );
  }

  /// `Краткое описание акции`
  String get short_description_stock_text {
    return Intl.message(
      'Краткое описание акции',
      name: 'short_description_stock_text',
      desc: '',
      args: [],
    );
  }

  /// `Основное описание акции`
  String get main_description_stock_text {
    return Intl.message(
      'Основное описание акции',
      name: 'main_description_stock_text',
      desc: '',
      args: [],
    );
  }

  /// `Дата начала`
  String get date_start_text {
    return Intl.message(
      'Дата начала',
      name: 'date_start_text',
      desc: '',
      args: [],
    );
  }

  /// `Дата окончания`
  String get date_end_text {
    return Intl.message(
      'Дата окончания',
      name: 'date_end_text',
      desc: '',
      args: [],
    );
  }

  /// `Фото`
  String get photo_text {
    return Intl.message(
      'Фото',
      name: 'photo_text',
      desc: '',
      args: [],
    );
  }

  /// `Добавить`
  String get add_text {
    return Intl.message(
      'Добавить',
      name: 'add_text',
      desc: '',
      args: [],
    );
  }

  /// `Телефон менеджера`
  String get telephone_manager_text {
    return Intl.message(
      'Телефон менеджера',
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

  /// `Отправить`
  String get to_send_text {
    return Intl.message(
      'Отправить',
      name: 'to_send_text',
      desc: '',
      args: [],
    );
  }

  /// `Введите название`
  String get enter_a_name_text {
    return Intl.message(
      'Введите название',
      name: 'enter_a_name_text',
      desc: '',
      args: [],
    );
  }

  /// `Введите описание`
  String get enter_a_desc_text {
    return Intl.message(
      'Введите описание',
      name: 'enter_a_desc_text',
      desc: '',
      args: [],
    );
  }

  /// `Выберите дату`
  String get choose_date_text {
    return Intl.message(
      'Выберите дату',
      name: 'choose_date_text',
      desc: '',
      args: [],
    );
  }

  /// `Введите номер телефона`
  String get enter_phone_number_text {
    return Intl.message(
      'Введите номер телефона',
      name: 'enter_phone_number_text',
      desc: '',
      args: [],
    );
  }

  /// `Введите ваш e-mail`
  String get enter_email_text {
    return Intl.message(
      'Введите ваш e-mail',
      name: 'enter_email_text',
      desc: '',
      args: [],
    );
  }

  /// `Здесь отображаются избранные акции.`
  String get thirst_fav_info_text {
    return Intl.message(
      'Здесь отображаются избранные акции.',
      name: 'thirst_fav_info_text',
      desc: '',
      args: [],
    );
  }

  /// `Нажмите на сердечко, чтобы добавить акцию`
  String get second_fav_info_text {
    return Intl.message(
      'Нажмите на сердечко, чтобы добавить акцию',
      name: 'second_fav_info_text',
      desc: '',
      args: [],
    );
  }

  /// `в “Избранное”.`
  String get third_fav_info_text {
    return Intl.message(
      'в “Избранное”.',
      name: 'third_fav_info_text',
      desc: '',
      args: [],
    );
  }

  /// `Перейти к акциям`
  String get go_to_stocks_text {
    return Intl.message(
      'Перейти к акциям',
      name: 'go_to_stocks_text',
      desc: '',
      args: [],
    );
  }

  /// `Очистить`
  String get clear_text {
    return Intl.message(
      'Очистить',
      name: 'clear_text',
      desc: '',
      args: [],
    );
  }

  /// `О ресторане`
  String get about_inst_text {
    return Intl.message(
      'О ресторане',
      name: 'about_inst_text',
      desc: '',
      args: [],
    );
  }

  /// `Адрес`
  String get address_text {
    return Intl.message(
      'Адрес',
      name: 'address_text',
      desc: '',
      args: [],
    );
  }

  /// `Режим работы`
  String get operating_mode_text {
    return Intl.message(
      'Режим работы',
      name: 'operating_mode_text',
      desc: '',
      args: [],
    );
  }

  /// `Пожаловаться`
  String get complain_text {
    return Intl.message(
      'Пожаловаться',
      name: 'complain_text',
      desc: '',
      args: [],
    );
  }

  /// `Забронировать`
  String get to_book_text {
    return Intl.message(
      'Забронировать',
      name: 'to_book_text',
      desc: '',
      args: [],
    );
  }

  /// `Эта акция уже находится в избранном.`
  String get already_have_text {
    return Intl.message(
      'Эта акция уже находится в избранном.',
      name: 'already_have_text',
      desc: '',
      args: [],
    );
  }

  /// `Акция добавлена в избранное.`
  String get stock_added_text {
    return Intl.message(
      'Акция добавлена в избранное.',
      name: 'stock_added_text',
      desc: '',
      args: [],
    );
  }

  /// `Акция удалена из избранного.`
  String get removed_stock_text {
    return Intl.message(
      'Акция удалена из избранного.',
      name: 'removed_stock_text',
      desc: '',
      args: [],
    );
  }

  /// `Все акции удалены из избранного.`
  String get all_stocks_removed {
    return Intl.message(
      'Все акции удалены из избранного.',
      name: 'all_stocks_removed',
      desc: '',
      args: [],
    );
  }

  /// `Выберите способ`
  String get choose_method_text {
    return Intl.message(
      'Выберите способ',
      name: 'choose_method_text',
      desc: '',
      args: [],
    );
  }

  /// `Из галерии`
  String get from_gallery_text {
    return Intl.message(
      'Из галерии',
      name: 'from_gallery_text',
      desc: '',
      args: [],
    );
  }

  /// `Камера`
  String get camera_text {
    return Intl.message(
      'Камера',
      name: 'camera_text',
      desc: '',
      args: [],
    );
  }

  /// `Да`
  String get yes_text {
    return Intl.message(
      'Да',
      name: 'yes_text',
      desc: '',
      args: [],
    );
  }

  /// `Нет`
  String get no_text {
    return Intl.message(
      'Нет',
      name: 'no_text',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get error_text {
    return Intl.message(
      'Ошибка',
      name: 'error_text',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста подтвердите`
  String get confirm_text {
    return Intl.message(
      'Пожалуйста подтвердите',
      name: 'confirm_text',
      desc: '',
      args: [],
    );
  }

  /// `Заявка успешно отправлена.`
  String get stock_on_block_text {
    return Intl.message(
      'Заявка успешно отправлена.',
      name: 'stock_on_block_text',
      desc: '',
      args: [],
    );
  }

  /// `Вы точно хотите удалить все акции из избранного?`
  String get sure_confirm_text {
    return Intl.message(
      'Вы точно хотите удалить все акции из избранного?',
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
