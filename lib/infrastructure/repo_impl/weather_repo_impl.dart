import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/domain/models/weather_model.dart';
import 'package:weather_app/domain/repository/weather_repo.dart';
import 'package:weather_app/infrastructure/network/api_services.dart';
import 'package:weather_app/presentation/custom_widgets/app_string.dart';

class WeatherImplementation extends WeatherRepo {
  final ApiService _apiServices = ApiService();
 
  @override
    Future<WeatherModel> fetchData({required String cityName}) async {
      debugPrint("my city name is $cityName");
    Response response = await _apiServices.call(
      AppString.baseUrl,
      queryParameters: {
        'q':cityName,
        'appid':'55acb5c980c3ce6695f94f68b8bba70d',
        'units':'metric'
      },
    );
    //List<dynamic> jsonData = [response.data];
    Map<String,dynamic> jsonData = response.data;
    debugPrint(response.data.toString());
   //List<WeatherModel> weatherList = jsonData.map((json) => WeatherModel.fromJson(json)).toList();
   WeatherModel  weatherData = WeatherModel.fromJson(jsonData);
    return weatherData;
  }
}