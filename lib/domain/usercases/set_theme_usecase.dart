import '../repositories/prefs_repository.dart';

class SetThemeUseCase {
  final PrefsRepository _prefsRepository;

  SetThemeUseCase(this._prefsRepository);

  Future<void> call({required bool params}) async {
    _prefsRepository.setTheme(params);
  }
}
