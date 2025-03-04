import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  String language = 'en';

  SettingsProvider() {
    _loadSettings();
  }

  void changeLanguage(String selectedLanguage) {
    language = selectedLanguage;
    _saveLanguage(selectedLanguage);
    notifyListeners();
  }

  Future<void> _saveLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    // Load language
    language = prefs.getString('language') ?? 'en';

    notifyListeners();
  }
}
