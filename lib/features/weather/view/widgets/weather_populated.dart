import 'package:flutter/material.dart';
import 'package:sky_cast/manager/responsive_manager.dart';

import '../../model/model/model.dart';

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated({
    super.key,
    required this.weather,
    required this.onRefresh,
  });

  final WeatherModel weather;
  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        _WeatherBackground(),
        RefreshIndicator(
          backgroundColor: theme.primaryColor,
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  Image.network(
                    'https://openweathermap.org/img/wn/${weather.iconCode}@2x.png',
                    height: ResponsiveManager.getVerticalSize(250),
                    width: ResponsiveManager.size.width,
                  ),
                  Text(
                    weather.cityName,
                    style: theme.textTheme.displayLarge,
                  ),
                  Text(
                    weather.countryName,
                    style: theme.textTheme.titleLarge,
                  ),
                  Divider(
                      endIndent: ResponsiveManager.size.width*0.2,
                      indent: ResponsiveManager.size.width*0.2,
                      thickness: 1.5),
                  Text(
                    '\n${weather.feelsLike.toString()}°C',
                    style: theme.textTheme.titleLarge,
                  ),
                  Text(
                    weather.description,
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _WeatherBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.25, 0.75, 0.90, 1.0],
            colors: [
              color,
              color.brighten(),
              color.brighten(33),
              color.brighten(50),
            ],
          ),
        ),
      ),
    );
  }
}

extension on Color {
  Color brighten([int percent = 10]) {
    assert(
      1 <= percent && percent <= 100,
      'percentage must be between 1 and 100',
    );
    final p = percent / 100;
    return Color.fromARGB(
      alpha,
      red + ((255 - red) * p).round(),
      green + ((255 - green) * p).round(),
      blue + ((255 - blue) * p).round(),
    );
  }
}
