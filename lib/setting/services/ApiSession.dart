import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ApiSession {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}