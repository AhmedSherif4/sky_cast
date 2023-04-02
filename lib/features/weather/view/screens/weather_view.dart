import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/manager/routing/route_manager.dart';

import '../../../../manager/material_design/theme_cubit/theme_cubit.dart';
import '../../view_model/cubit/weather_cubit.dart';
import '../widgets/widgets.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
          actions: [
            BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
              final ThemeCubit cubit = BlocProvider.of<ThemeCubit>(context);
              return IconButton(
                  onPressed: () {
                    cubit.themeModeIsDark()
                        ? cubit.isDark(false)
                        : cubit.isDark(true);
                  },
                  icon: Icon(cubit.themeModeIsDark()
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded));
            }),
          ],
        ),
        body: Center(
          child: BlocProvider.value(
            value: BlocProvider.of<WeatherCubit>(context),
            child: BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                switch (state.status) {
                  case WeatherStatus.initial:
                    print('ui init');
                    return const WeatherEmpty();
                  case WeatherStatus.loading:
                    print('ui loading');
                    return const WeatherLoading();
                  case WeatherStatus.success:
                    print('ui success');
                    return WeatherPopulated(
                      weather: state.weather,
                      onRefresh: () {
                        return context.read<WeatherCubit>().refreshWeather();
                      },
                    );
                  case WeatherStatus.failure:
                    print('ui failure');
                    return const WeatherError();
                }
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          isExtended: true,
          label: const Icon(Icons.search),
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.searchRoute);
          },
        ));
  }
}
