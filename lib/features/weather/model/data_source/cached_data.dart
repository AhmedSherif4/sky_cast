// key for special data
import 'package:flutter/foundation.dart';
import 'package:sky_cast/features/weather/model/model/model.dart';

const cacheDataKey = 'CacheDataKey';
const cacheDataInterval = 60 * 1000 * 5; // 1 minute cache in milliseconds

abstract class CachedWeatherData {
  Future<WeatherModel> getData();
  Future<void> saveDataToCache(WeatherModel data);
  void clearData();
  void removeFromData(String key);
}

class CachedWeatherDataImpl implements CachedWeatherData {
  Map<String, CachedModel> cacheMap = {};

  @override
  void clearData() {
    cacheMap.clear();
  }

  @override
  Future<WeatherModel> getData() async {
    CachedModel? cachedModel = cacheMap[cacheDataKey];
    if (cachedModel != null && cachedModel.isValid(cacheDataInterval)) {
      if (kDebugMode) {
        print('Data got from Cache:${cachedModel.data}');
      }
      return cachedModel.data;
    } else {
      throw Exception();
    }
  }

  @override
  void removeFromData(String key) {
    cacheMap.remove(key);
  }

  @override
  Future<void> saveDataToCache(WeatherModel data) async {
    cacheMap[cacheDataKey] = CachedModel(data);
  }
}

class CachedModel {
  WeatherModel data;
  int cachedTime = DateTime.now().microsecondsSinceEpoch;
  CachedModel(this.data);
}

extension CachedModelExtension on CachedModel {
  bool isValid(int expirationTime) {
    int currentTimeInMilliseconds = DateTime.now().microsecondsSinceEpoch;
    return currentTimeInMilliseconds - cachedTime < expirationTime;
  }
}
