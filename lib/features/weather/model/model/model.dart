class WeatherModel {
  final int id;
  final String cityName;
  final String main;
  final String description;
  final int pressure;
  final double feelsLike;
  final String countryName;
  WeatherModel({
    required this.id,
    required this.cityName,
    required this.main,
    required this.description,
    required this.pressure,
    required this.feelsLike,
    required this.countryName,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json["id"],
        cityName: json["name"],
        main: json["weather"][0]["main"],
        description: json["weather"][0]["description"],
        pressure: json["main"]["pressure"],
        feelsLike: json["main"]["feels_like"],
        countryName: json["sys"]["country"],
      );

 static WeatherModel emptyWeather = WeatherModel(
      id: 0,
      cityName: 'No Name',
      main: 'No main',
      description: 'No Description',
      pressure: 0,
      feelsLike: 0.0,
      countryName: 'No Country Name');
}
