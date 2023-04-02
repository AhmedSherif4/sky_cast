import 'package:flutter/material.dart';

import '../../../../manager/material_design/font_manager.dart';
import '../../../../manager/responsive_manager.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('🙈',
            style: TextStyle(
                fontSize: ResponsiveManager.getFontSize(FontSize.s60))),
        Text(
          '\nSomething went wrong!',
          style: theme.textTheme.headlineLarge,
        ),
      ],
    );
  }
}
