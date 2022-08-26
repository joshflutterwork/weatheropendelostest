import 'package:dio/dio.dart';
import 'package:weatherdelostest/core/network/endpoints.dart';
import 'package:weatherdelostest/core/network/network_app.dart';
import 'package:weatherdelostest/features/weather/data/weather_model.dart';

class WeatherRepo {
  getWeather() async {
    try {
      Response resp = await NetworkApp.get(url: Endpoints.url());
      return WeatherModel.fromJson(resp.data);
    } catch (e) {
      return null;
    }
  }
}
