import 'package:flutter/material.dart';
import 'package:sky_cast/manager/material_design/font_manager.dart';
import 'package:sky_cast/manager/responsive_manager.dart';

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
         Text('⛅', style: TextStyle(fontSize: ResponsiveManager.getFontSize(FontSize.s60))),
        Text(
          'Loading Weather',
          style: theme.textTheme.headlineLarge,
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator.adaptive(),
        ),
      ],
    );
  }
}
