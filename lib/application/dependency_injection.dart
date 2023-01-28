import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_mode_bloc/theme_mode_bloc.dart';
import 'app_pref.dart';



final GetIt instanceGetIt = GetIt.instance;

Future<void> initialAppModule()async{
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  instanceGetIt.registerLazySingleton<SharedPreferences>(()=>sharedPreferences);
  instanceGetIt.registerLazySingleton<AppPreferences>(()=> AppPreferences(instanceGetIt()));
  instanceGetIt.registerFactory<ThemeModeBloc>(()=>ThemeModeBloc(appPreferences: instanceGetIt()));
}