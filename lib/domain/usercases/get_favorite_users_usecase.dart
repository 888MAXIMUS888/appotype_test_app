import '../repositories/prefs_repository.dart';

class GetFavoriteUsersUseCase {
  final PrefsRepository _prefsRepository;

  GetFavoriteUsersUseCase(this._prefsRepository);

  Future<List<String>> call() async {
    return await _prefsRepository.getFavoriteUsers();
  }
}
