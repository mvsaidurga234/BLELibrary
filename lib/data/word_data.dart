import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordRepository {
  static Map<String, List<String>> _categories = {};
  static const String _storageKey = "user_categories";

  static Future<void> loadWords() async {
    final data = await rootBundle.loadString('assets/words.json');
    final Map<String, dynamic> jsonResult = json.decode(data);
    _categories = jsonResult.map((key, value) =>
        MapEntry(key, List<String>.from(value)));

    final prefs = await SharedPreferences.getInstance();
    final String? savedData = prefs.getString(_storageKey);
    if (savedData != null) {
      final Map<String, dynamic> userCategories = json.decode(savedData);
      userCategories.forEach((key, value) {
        _categories[key] = List<String>.from(value);
      });
    }
  }

  static List<String> getCategories() => _categories.keys.toList();

  static List<String> getWords(String category) => _categories[category] ?? [];

  static Future<void> addCategory(String name, List<String> words) async {
    _categories[name] = words;

    final prefs = await SharedPreferences.getInstance();
    final userCategories = _categories
      ..removeWhere((key, _) => defaultCategories.contains(key));

    prefs.setString(_storageKey, json.encode(userCategories));
  }

  static final List<String> defaultCategories = [
    'Animals', 'Fruits', 'Countries'
  ];
}
