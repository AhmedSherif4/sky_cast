import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/theme/theme_mode_bloc/theme_mode_bloc.dart';
import 'package:sky_cast/weather/weather.dart';

import '../../theme/theme_mode_manager.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage._();
  static Route<void> route(WeatherCubit weatherCubit) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: weatherCubit,
        child: const SettingsPage._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: <Widget>[
          BlocBuilder<WeatherCubit, WeatherState>(
            buildWhen: (previous, current) =>
                previous.temperatureUnits != current.temperatureUnits,
            builder: (context, state) {
              return ListTile(
                title: const Text('Temperature Units'),
                isThreeLine: true,
                subtitle: const Text(
                  'Use metric measurements for temperature units.',
                ),
                trailing: Switch(
                  value: state.temperatureUnits.isCelsius,
                  onChanged: (_) => context.read<WeatherCubit>().toggleUnits(),
                ),
              );
            },
          ),
          BlocBuilder<ThemeModeBloc, ThemeModeState>(
            builder: (context, state) {
              return ListTile(
                title: const Text('Theme Mode'),
                isThreeLine: true,
                subtitle: const Text(
                  'Change theme mode of the whole application.',
                ),
                trailing: Switch(
                  value: context.watch<ThemeModeBloc>().isDark,
                  onChanged: (isDark) {
                    context.read<ThemeModeBloc>().add(ThemeChanged(
                        theme: isDark ?AppTheme.Dark: AppTheme.Light ,
                        isDark: isDark));
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
