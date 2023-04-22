import '../../domain/repositories/prefs_repository.dart';
import '../../injector.dart';
import '../local/shared_preferences_service.dart';

class PrefsRepositoryImpl extends PrefsRepository {
  @override
  void setTheme(bool isDarkTheme) async {
    await injector.get<SharedPreferencesService>().setDarkTheme(isDarkTheme);
  }

  @override
  Future<bool> getTheme() async {
    return await injector.get<SharedPreferencesService>().getTheme();
  }

  @override
  Future<List<String>> getFavoriteUsers() async {
    return await injector.get<SharedPreferencesService>().getFavoriteUsers();
  }

  @override
  void setFavoriteUsers(List<String> favoriteUsers) async {
    await injector
        .get<SharedPreferencesService>()
        .setFavoriteUsers(favoriteUsers);
  }
}
