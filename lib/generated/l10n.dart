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

  /// `Hello World!`
  String get hello_world {
    return Intl.message(
      'Hello World!',
      name: 'hello_world',
      desc: '',
      args: [],
    );
  }

  /// `Where To Have Lunch?`
  String get appName {
    return Intl.message(
      'Where To Have Lunch?',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Login With Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login With Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `The easiest way of choosing where to have a nice meal with colleges`
  String get welcomeMessageBody {
    return Intl.message(
      'The easiest way of choosing where to have a nice meal with colleges',
      name: 'welcomeMessageBody',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to "Where to Have Lunch?"`
  String get welcomeMessageTitle {
    return Intl.message(
      'Welcome to "Where to Have Lunch?"',
      name: 'welcomeMessageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Places`
  String get places {
    return Intl.message(
      'Places',
      name: 'places',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Choose!`
  String get choose {
    return Intl.message(
      'Choose!',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Add a Place`
  String get addAPlace {
    return Intl.message(
      'Add a Place',
      name: 'addAPlace',
      desc: '',
      args: [],
    );
  }

  /// `This field is required.`
  String get requiredField {
    return Intl.message(
      'This field is required.',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Place name`
  String get placeName {
    return Intl.message(
      'Place name',
      name: 'placeName',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Add Place`
  String get addPlace {
    return Intl.message(
      'Add Place',
      name: 'addPlace',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Your Places`
  String get yourPlaces {
    return Intl.message(
      'Your Places',
      name: 'yourPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Edit Place`
  String get editPlace {
    return Intl.message(
      'Edit Place',
      name: 'editPlace',
      desc: '',
      args: [],
    );
  }

  /// `Hello {user}`
  String helloUser(Object user) {
    return Intl.message(
      'Hello $user',
      name: 'helloUser',
      desc: '',
      args: [user],
    );
  }

  /// `You are offline`
  String get youAreOffline {
    return Intl.message(
      'You are offline',
      name: 'youAreOffline',
      desc: '',
      args: [],
    );
  }

  /// `Demo Mode`
  String get demoMode {
    return Intl.message(
      'Demo Mode',
      name: 'demoMode',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this place?`
  String get deletePlaceConfirmation {
    return Intl.message(
      'Do you want to delete this place?',
      name: 'deletePlaceConfirmation',
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
      Locale.fromSubtags(languageCode: 'es'),
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
