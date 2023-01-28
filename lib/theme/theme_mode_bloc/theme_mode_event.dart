part of 'theme_mode_bloc.dart';

abstract class ThemeModeEvent extends Equatable {
  const ThemeModeEvent();
}

class ThemeChanged extends ThemeModeEvent {
  final AppTheme theme;
  final bool isDark;

  const ThemeChanged({required this.theme, required this.isDark});

  @override
  List<Object> get props => [theme, isDark];
}
