
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sky_cast/application/app_pref.dart';
import '../theme_mode_manager.dart';
part 'theme_mode_event.dart';
part 'theme_mode_state.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  final AppPreferences appPreferences;
  ThemeModeBloc({required this.appPreferences})
      : super(ThemeModeState(themeData: appThemeData[AppTheme.Light]!)) {
    on<ThemeChanged>(_onThemeChanged);
  }
bool isDark=false;
  void _onThemeChanged(ThemeChanged event, Emitter<ThemeModeState> emit) async{
    appPreferences.saveTheme(event.theme);
    isDark = event.isDark;
    emit(ThemeModeState(themeData: appThemeData[event.theme]!));
  }

/*   @override
  ThemeModeState? fromJson(Map<String, dynamic> json) =>
      ThemeModeState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ThemeModeState state) => state.toJson(state); */
}
