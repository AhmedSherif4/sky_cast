
part of 'weather_cubit.dart';

enum WeatherStatus { initial, success, failure, loading }

extension WeatherStatusx on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;

  bool get isSuccess => this == WeatherStatus.success;

  bool get isFailure => this == WeatherStatus.failure;

  bool get isLoading => this == WeatherStatus.loading;
}


@JsonSerializable()
class WeatherState extends Equatable {
  final WeatherStatus status;
  final Weather weather;
  final TemperatureUnits temperatureUnits;

  WeatherState({
    this.status = WeatherStatus.initial,
    Weather? weather,
    this.temperatureUnits = TemperatureUnits.celsius,
  }) : weather = weather ?? Weather.empty;

  factory WeatherState.fromJson(Map<String, dynamic> json) => _$WeatherStateFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    TemperatureUnits? temperatureUnits,
  }) {
    return WeatherState(
      status: status ?? this.status,
      temperatureUnits: temperatureUnits ?? this.temperatureUnits,
      weather: weather ?? this.weather,
    );
  }

  @override
  List<Object> get props => [status, weather, temperatureUnits];
}
