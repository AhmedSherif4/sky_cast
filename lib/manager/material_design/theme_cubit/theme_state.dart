part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  const ThemeState();
}

class ThemeInitial extends ThemeState {}

class SetTheme extends ThemeState {}

class GetTheme extends ThemeState {}
