import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/weather_bloc_observer.dart';
import 'application/app.dart';
import 'application/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  Bloc.observer = WeatherBlocObserver(); // instance the observer

  runApp(
    MyApp(),
  );
}
