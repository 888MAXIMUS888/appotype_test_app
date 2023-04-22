import '../repositories/prefs_repository.dart';

class SetFavoriteUsersUseCase {
  final PrefsRepository _prefsRepository;

  SetFavoriteUsersUseCase(this._prefsRepository);

  Future<void> call({required List<String> params}) async {
    _prefsRepository.setFavoriteUsers(params);
  }
}
