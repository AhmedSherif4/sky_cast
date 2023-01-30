part of 'theme_mode_bloc.dart';

abstract class ThemeModeEvent extends Equatable {
  const ThemeModeEvent();
}

class ThemeChanged extends ThemeModeEvent {

  final bool switchValue;

  const ThemeChanged({required this.switchValue});

  @override
  List<Object> get props => [switchValue];
}
