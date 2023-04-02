import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/manager/routing/route_manager.dart';

import '../features/weather/view_model/cubit/weather_cubit.dart';
import '../manager/material_design/theme_cubit/theme_cubit.dart';
import '../manager/material_design/theme_manager.dart';
import 'dependency_injection.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => instance<ThemeCubit>()),
          BlocProvider(create: (_) => instance<WeatherCubit>()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: Routes.weatherRoute,
              debugShowCheckedModeBanner: false,
              theme: appThemeData[AppTheme.light],
              darkTheme: appThemeData[AppTheme.dark],
              themeMode: context.read<ThemeCubit>().themeModeIsDark()
                  ? ThemeMode.dark
                  : ThemeMode.light,
            );
          },
        ));
  }
}
