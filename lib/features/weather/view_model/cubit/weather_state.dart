part of 'weather_cubit.dart';

enum WeatherStatus { initial, success, failure, loading }

extension WeatherStatusx on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;

  bool get isSuccess => this == WeatherStatus.success;

  bool get isFailure => this == WeatherStatus.failure;

  bool get isLoading => this == WeatherStatus.loading;
}

class WeatherState extends Equatable {
  final WeatherStatus status;
  final WeatherModel weather;
  final String errorMessage;

  WeatherState({
    this.status = WeatherStatus.initial,
    WeatherModel? weather,
    this.errorMessage = '',
  }) : weather = weather ?? WeatherModel.emptyWeather;

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherModel? weather,
    String? errorMessage,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? weather,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, weather, errorMessage];
}
