import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
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
    DevicePreview(
      enabled: !kReleaseMode || !kProfileMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}
/* 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  Bloc.observer = WeatherBlocObserver(); // instance the observer

  runApp(
    MyApp(),
  );
} */
