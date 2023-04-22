import '../repositories/prefs_repository.dart';

class GetThemeUseCase {
  final PrefsRepository _prefsRepository;

  GetThemeUseCase(this._prefsRepository);

  Future<bool> call() async {
    return await _prefsRepository.getTheme();
  }
}
