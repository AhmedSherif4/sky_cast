import 'package:flutter/material.dart';
import 'package:sky_cast/features/weather/view/screens/weather_view.dart';

import '../../features/search/view/search_view.dart';


class Routes {
  static const String weatherRoute = '/';
  static const String searchRoute = 'searchRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.weatherRoute:
        return MaterialPageRoute(builder: (_) => const WeatherView());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (_) =>  SearchView(),);
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const UnDefinedView(),
    );
  }
}

class UnDefinedView extends StatelessWidget {
  const UnDefinedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Route Found'),
      ),
      body: const Center(
        child: Text('No Route Found'),
      ),
    );
  }
}
