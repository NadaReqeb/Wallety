import 'package:flutter/material.dart';
import 'package:wallety/preferences/app_preferences.dart';

class LanguageProvider extends ChangeNotifier {

  String languageCode = AppPreferences().language;

  void changeLanguage(String languageCode){
    AppPreferences().setLanguage(languageCode);
    this.languageCode = languageCode;
    notifyListeners();
  }
}
