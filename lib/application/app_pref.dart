import 'package:shared_preferences/shared_preferences.dart';

const String preferenceKeyDarkThemeModeOn = 'preferenceKeyDarkThemeModeOn';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // for theme mode
  isDarkMode(bool isDark) async {
    await _sharedPreferences.setBool(preferenceKeyDarkThemeModeOn, isDark);
  }

  themeModeIsDark() {

    return _sharedPreferences.getBool(preferenceKeyDarkThemeModeOn) ?? false;
  }
}
