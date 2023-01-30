import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sky_cast/weather_bloc_observer.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:path_provider/path_provider.dart';

import 'application/app.dart';

//setup our HydratedStorage to persist state across sessions.
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = WeatherBlocObserver();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory(),
  );

  runApp(WeatherApp(weatherRepository: WeatherRepository(),),);

}
