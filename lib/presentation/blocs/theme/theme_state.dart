part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class GetThemeState extends ThemeState {
  final bool isDarkTheme;
  const GetThemeState(this.isDarkTheme);

  @override
  List<Object> get props => [isDarkTheme];
}
