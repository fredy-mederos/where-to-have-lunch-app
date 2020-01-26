import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:where_to_have_lunch/res/text/strings_base.dart';
import 'package:where_to_have_lunch/res/text/strings_en.dart';
import 'package:where_to_have_lunch/res/text/strings_es.dart';

class CustomLocalizationsDelegate extends LocalizationsDelegate<StringsBase> {

  static StringsBase stringsBase = StringsEn();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", ""),
      Locale("es", ""),
    ];
  }

  @override
  Future<StringsBase> load(Locale locale) {
    switch (locale.languageCode) {
      case "en":
        stringsBase = StringsEn();
        break;
      case "es":
        stringsBase = StringsEs();
        break;
      default:
        stringsBase = StringsEn();
        break;
    }
    return SynchronousFuture<StringsBase>(stringsBase);
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      return resolve(locale, fallback, supported);
    };
  }

  Locale resolve(Locale locale, Locale fallback, Iterable<Locale> supported) {
    if (locale == null || !isSupported(locale)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  @override
  bool isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        if (supportedLocale.countryCode == null ||
            supportedLocale.countryCode.isEmpty) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  bool shouldReload(LocalizationsDelegate<StringsBase> old) => false;
}
