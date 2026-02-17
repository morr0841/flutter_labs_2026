import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

class DataRepository{
  static String loginName = "";

  static final EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
  static Future<void> loadData() async {
    loginName = await prefs.getString("Username");
      }

  static void saveData(String username) async {
    loginName = username;
    await prefs.setString("Username", username);
  }

}