import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

class DataRepository{
  static String loginName = "";
  static String password = "";

  static final EncryptedSharedPreferences prefs = EncryptedSharedPreferences();

  static Future<void> loadData() async {
    loginName = await prefs.getString("Username");
    password = await prefs.getString("UserPassword");
      }

  static void saveData(String username, String passwordField) async {
    loginName = username;
    password = passwordField;
    await prefs.setString("Username", username);
    await prefs.setString("UserPassword", passwordField);
  }

}