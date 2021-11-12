import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';


class _AppLocalizationsDelegate extends LocalizationsDelegate<LanguageHelper> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hi'].contains(locale.languageCode);

  @override
  Future<LanguageHelper> load(Locale locale) => _load(locale);

  static Future<LanguageHelper> _load(Locale locale) async {
    LanguageHelper localizations = new LanguageHelper(locale);
    await localizations._load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<LanguageHelper> old) => false;
}

const String prefSelectedLanguageCode = "SelectedLanguageCode";

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(prefSelectedLanguageCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(prefSelectedLanguageCode) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  return languageCode.isNotEmpty
      ? Locale(languageCode, '')
      : Locale('en', '');
}

void changeLanguage(BuildContext context, String selectedLanguageCode) async {
  var _locale = await setLocale(selectedLanguageCode);
  MyApp.setLocale(context, _locale);
}

class LanguageHelper {
  final Locale locale;

  LanguageHelper(this.locale);

  static LanguageHelper? of(BuildContext context) {
    return Localizations.of<LanguageHelper>(context, LanguageHelper);
  }

  static const LocalizationsDelegate<LanguageHelper> delegate =
  _AppLocalizationsDelegate();


  Map<String, dynamic> _jsonMap={};

  Future<bool> _load() async {
    String jsonString =
    await rootBundle.loadString('language/${locale.languageCode}.json');
    _jsonMap = json.decode(jsonString);
    return true;
  }

  String _translate(String key) {
    return _jsonMap[key];
  }

  List<String> _translateArray(String key) {
    return List.castFrom(_jsonMap[key]);
  }

  String get appName => _translate('appName');
}