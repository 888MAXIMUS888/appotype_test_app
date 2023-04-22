abstract class PrefsRepository {
  void setTheme(bool isDarkTheme);

  Future<bool> getTheme();

  void setFavoriteUsers(List<String> favoriteUsers);

  Future<List<String>> getFavoriteUsers();
}
