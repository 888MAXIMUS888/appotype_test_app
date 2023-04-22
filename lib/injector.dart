import 'package:appotype_test_app/presentation/blocs/theme/theme_bloc.dart';
import 'package:appotype_test_app/presentation/blocs/users/users_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/local/shared_preferences_service.dart';
import 'data/repositoris/prefs_repository_impl.dart';
import 'data/repositoris/users_repository_impl.dart';
import 'domain/repositories/prefs_repository.dart';
import 'domain/repositories/users_repository.dart';
import 'domain/usercases/fetch_users_usecase.dart';
import 'domain/usercases/get_favorite_users_usecase.dart';
import 'domain/usercases/get_theme_usecase.dart';
import 'domain/usercases/set_favorite_users_usecase.dart';
import 'domain/usercases/set_theme_usecase.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies(SharedPreferences sharedPreferences) async {
  /// Shared Preferences
  injector.registerSingleton(sharedPreferences);

  /// Dependencies
  injector.registerSingleton(SharedPreferencesService(injector()));

  /// Repositories
  injector.registerSingleton<UsersRepository>(UsersRepositoryImpl());
  injector.registerSingleton<PrefsRepository>(PrefsRepositoryImpl());

  /// UseCases
  injector.registerSingleton(FetchUsersUseCase(injector()));
  injector.registerSingleton(GetThemeUseCase(injector()));
  injector.registerSingleton(SetThemeUseCase(injector()));
  injector.registerSingleton(SetFavoriteUsersUseCase(injector()));
  injector.registerSingleton(GetFavoriteUsersUseCase(injector()));

  /// Blocs
  injector.registerLazySingleton(
      () => UsersBloc(injector(), injector(), injector()));
  injector.registerLazySingleton(() => ThemeBloc(injector(), injector()));
}
