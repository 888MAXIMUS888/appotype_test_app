import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences prefs;

  SharedPreferencesService(this.prefs);

  static const _themeStatus = "themeStatus";
  static const _favoriteUsers = "favoriteUsers";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeStatus) ?? false;
  }

  setFavoriteUsers(List<String> favoriteUsers) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_favoriteUsers, favoriteUsers);
  }

  Future<List<String>> getFavoriteUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoriteUsers) ?? [];
  }
}
