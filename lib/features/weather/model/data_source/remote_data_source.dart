import 'package:sky_cast/features/weather/model/model/model.dart';

import '../../../../manager/network/http_factory.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getWeatherByCityName(String cityName);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final HttpFactory _httpFactory;

  RemoteDataSourceImpl(this._httpFactory);

  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async {
    final result = await _httpFactory.getData('weather?q=$cityName');
    WeatherModel weather = WeatherModel.fromJson(result);
/*     print(weather.cityName);
    print(weather.countryName);
    print(weather.description);
    print(weather.feelsLike);
    print(weather.id);
    print(weather.main);
    print(weather.pressure); */
    return weather;
  }
}
