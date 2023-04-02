import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sky_cast/features/weather/view_model/repository/repository.dart';

import '../../model/model/model.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final BaseRepository _baseRepository;
  WeatherCubit(this._baseRepository) : super(WeatherState());

  String? searchValue;

  void setSearchValue(String cityName) {
    searchValue = cityName;
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    emit(state.copyWith(status: WeatherStatus.loading));
    try {
      if (searchValue != null) {
        final result = await _baseRepository.getWeatherByCityName(searchValue!);
        result.fold(
          (failure) => emit(state.copyWith(
              status: WeatherStatus.failure, errorMessage: failure.message)),
          (data) => emit(state.copyWith(
            status: WeatherStatus.success,
            weather: data,
          )),
        );
      } else {
        emit(WeatherState(status: WeatherStatus.initial));
      }
    } on Exception {

      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }

  Future<void> refreshWeather() async {

    if (!state.status.isSuccess) return;
    if (state.weather == WeatherModel.emptyWeather) return;
    final result =
        await _baseRepository.getWeatherByCityName(state.weather.cityName);
    result.fold(
      (failure) => emit(state.copyWith(
        status: WeatherStatus.failure,
        errorMessage: failure.message,
      )),
      (data) => emit(state.copyWith(
        status: WeatherStatus.success,
        weather: data,
      )),
    );
  }
}
