import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale? locale;

  AppLocalization(this.locale);

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationsDelegate();

  late Map<String, String> _localizationStrings;

  Future loadJsonLanguage() async {
    String jsonSting =
        await rootBundle.loadString("assets/lang/${locale!.languageCode}.json");

    Map<String, dynamic> jsonMap = json.decode(jsonSting);
    _localizationStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) => _localizationStrings[key] ?? '';
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale);
    await localization.loadJsonLanguage();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}

extension TranslateX on String {
  String tr(BuildContext context) {
    return AppLocalization.of(context)!.translate(this);
  }
}
