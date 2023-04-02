import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_cast/features/weather/model/data_source/remote_data_source.dart';
import 'package:sky_cast/features/weather/view_model/repository/repository.dart';
import 'package:sky_cast/manager/material_design/theme_cubit/theme_cubit.dart';

import '../features/weather/model/data_source/cached_data.dart';
import '../features/weather/view_model/cubit/weather_cubit.dart';
import '../manager/network/http_factory.dart';
import '../manager/network/network_info.dart';
import 'app_pref.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // shared Preferences instance
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // app Preferences instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
  // cached Data
  instance
      .registerLazySingleton<CachedWeatherData>(() => CachedWeatherDataImpl());
  // remote Data
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));
  // repository
  instance.registerLazySingleton<BaseRepository>(
      () => Repository(instance(), instance(), instance()));


  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  // http factory
  instance.registerLazySingleton<HttpFactory>(() => HttpFactory());


  // theme cubit
  instance.registerFactory<ThemeCubit>(() => ThemeCubit(instance()));
  // weather cubit
  instance.registerFactory<WeatherCubit>(() => WeatherCubit(instance()));
}
