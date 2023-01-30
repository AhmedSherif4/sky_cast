import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/application/dependency_injection.dart';
import 'package:sky_cast/theme/cubit/theme_cubit.dart';
import 'package:sky_cast/theme/theme_mode_bloc/theme_mode_bloc.dart';
import 'package:sky_cast/theme/theme_mode_manager.dart';
import 'package:sky_cast/weather/view/weather_page.dart';
import 'package:weather_repository/weather_repository.dart';

import 'app_pref.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key, required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  final WeatherRepository _weatherRepository;


  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (_) => ThemeCubit(),
          ),
          BlocProvider<ThemeModeBloc>(
            create: (_) => ThemeModeBloc()
              /* ..add(
                ThemeChanged(
                  switchValue: 
                ),
              ), */
          ),
        ],
        child: const WeatherAppView(),
      ),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeBloc, ThemeModeState>(
      builder: (BuildContext context, ThemeModeState themeState) {
        return BlocBuilder<ThemeCubit, Color>(
          builder: (context, color) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeState.switchValue
                  ? appThemeData[AppTheme.Dark]?.copyWith(
                      primaryColor: color,
                      appBarTheme: AppBarTheme(
                        backgroundColor: color,
                      ),
                      switchTheme: SwitchThemeData(
                        trackColor: MaterialStateProperty.all(color),
                      ),
                      floatingActionButtonTheme:
                          FloatingActionButtonThemeData(backgroundColor: color),
                    )
                  : appThemeData[AppTheme.Light]?.copyWith(
                      primaryColor: color,
                      appBarTheme: AppBarTheme(
                        backgroundColor: color,
                      ),
                      switchTheme: SwitchThemeData(
                        trackColor: MaterialStateProperty.all(color),
                      ),
                      floatingActionButtonTheme:
                          FloatingActionButtonThemeData(backgroundColor: color),
                    ),
              home: const WeatherPage(),
            );
          },
        );
      },
    );
  }
}
