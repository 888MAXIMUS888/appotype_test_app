part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class SetTheme extends ThemeEvent {
  const SetTheme();
}

class GetTheme extends ThemeEvent {
  const GetTheme();
}
