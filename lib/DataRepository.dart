import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

class DataRepository{
  static String loginName = "";
  static String password = "";
  static String firstName = "";
  static String lastName = "";
  static String phone = "";
  static String email = "";

  static final EncryptedSharedPreferences prefs = EncryptedSharedPreferences();

  static Future<void> loadData() async {
    loginName = await prefs.getString("Username");
    password = await prefs.getString("UserPassword");
    firstName = await prefs.getString("UserFirstName");
    lastName = await prefs.getString("UserLastName");
    phone = await prefs.getString("UserPhone");
    email = await prefs.getString("UserEmail");
      }

  static Future<void> saveData({
    String? username,
    String? passwordField,
    String? fName,
    String? lName,
    String? phoneField,
    String? emailField,
  }) async {

    if (username != null && username.isNotEmpty) {
      loginName = username;
      await prefs.setString("Username", username);
    }

    if (passwordField != null && passwordField.isNotEmpty) {
      password = passwordField;
      await prefs.setString("UserPassword", passwordField);
    }

    if (fName != null && fName.isNotEmpty) {
      firstName = fName;
      await prefs.setString("UserFirstName", fName);
    }

    if (lName != null && lName.isNotEmpty) {
      lastName = lName;
      await prefs.setString("UserLastName", lName);
    }

    if (phoneField != null && phoneField.isNotEmpty) {
      phone = phoneField;
      await prefs.setString("UserPhone", phoneField);
    }

    if (emailField != null && emailField.isNotEmpty) {
      email = emailField;
      await prefs.setString("UserEmail", emailField);
    }
  }


}