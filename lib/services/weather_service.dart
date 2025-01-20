import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "765d519fb3544b68be0125110242107";

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

      // تحويل response.data إلى Map<String, dynamic>
      Map<String, dynamic> data = response.data;

      WeatherModel weatherModel = WeatherModel.fromJson(data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "Oops, there was an error, please try later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Oops, there was an error, please try later");
    }
  }
}
