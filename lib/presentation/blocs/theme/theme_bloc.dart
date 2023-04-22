import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usercases/get_theme_usecase.dart';
import '../../../domain/usercases/set_theme_usecase.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  GetThemeUseCase _getThemeUseCase;
  SetThemeUseCase _setThemeUseCase;
  bool _isDarkTheme = false;

  ThemeBloc(this._getThemeUseCase, this._setThemeUseCase)
      : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      if (event is SetTheme) {
        _isDarkTheme = !_isDarkTheme;
        await _setThemeUseCase.call(params: _isDarkTheme);
      } else if (event is GetTheme) {
        bool isDarkTheme = await _getThemeUseCase.call();
        emit(GetThemeState(isDarkTheme));
      }
    });
  }
}