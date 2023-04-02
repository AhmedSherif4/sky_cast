// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:sky_cast/features/weather/model/data_source/cached_data.dart';
import 'package:sky_cast/features/weather/model/data_source/remote_data_source.dart';
import 'package:sky_cast/features/weather/model/model/model.dart';

import '../../../../application/exeptions/failure.dart';
import '../../../../manager/network/network_info.dart';

abstract class BaseRepository {
  Future<Either<Failure, WeatherModel>> getWeatherByCityName(String cityName);
}

class Repository implements BaseRepository {
  final RemoteDataSource _dataSource;
  final CachedWeatherData _cachedWeatherData;
  final NetworkInfo _networkInfo;
  Repository(this._dataSource, this._cachedWeatherData, this._networkInfo);
  @override
  Future<Either<Failure, WeatherModel>> getWeatherByCityName(
      String cityName) async {
    try {
      return Right(await _cachedWeatherData.getData());
    } catch (_) {
      if (await _networkInfo.isConnected) {
        try {
          return Right(await _dataSource.getWeatherByCityName(cityName));
        } catch (error) {
          return Left(Failure(error.toString()));
        }
      } else {
        return Left(Failure("NO INTERNET CONNECTION"));
      }
    }
  }
}
