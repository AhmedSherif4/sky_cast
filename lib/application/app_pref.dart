
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_mode_manager.dart';

const String preferenceKeyDarkThemeModeOn = 'preferenceKeyDarkThemeModeOn';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // Theme mode settings
 
saveTheme(AppTheme? selectedTheme){
  selectedTheme ??= AppTheme.Light;
  String theme = jsonEncode(selectedTheme.toString());
  _sharedPreferences.setString(preferenceKeyDarkThemeModeOn, theme);
}
AppTheme getTheme(){
  String? theme = _sharedPreferences.getString(preferenceKeyDarkThemeModeOn);
  if(theme==null)return AppTheme.Light;
  return getThemeFromString(jsonDecode(theme))??AppTheme.Light;
}

  AppTheme? getThemeFromString(String themeString) {
    for (AppTheme theme in AppTheme.values) {
      if(theme.toString()==themeString){
        return theme;
      }
    }
      return null;
  }

}
