import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weatherModel.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  String baseUrl = 'https://api.weatherapi.com/v1';
  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=fbe1548b727a41aaa3284221241508&q=$city&days=1');

      WeatherModel weatherModel = WeatherModel.fromJason(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'There Was An Error , Try Later.';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('There Was An Error , Try Later.');
    }
  }
}
