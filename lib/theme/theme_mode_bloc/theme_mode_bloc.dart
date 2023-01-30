import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sky_cast/application/app_pref.dart';
import '../theme_mode_manager.dart';
part 'theme_mode_event.dart';
part 'theme_mode_state.dart';

class ThemeModeBloc extends HydratedBloc<ThemeModeEvent, ThemeModeState> {
  ThemeModeBloc() : super(const ThemeModeState(switchValue: false)) {
    on<ThemeChanged>(_onThemeChanged);
  }
  void _onThemeChanged(ThemeChanged event, Emitter<ThemeModeState> emit) async {
    emit(ThemeModeState(switchValue: event.switchValue));
  }

  @override
  ThemeModeState? fromJson(Map<String, dynamic> json) =>
      ThemeModeState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ThemeModeState state) => state.toJson(state);
}
