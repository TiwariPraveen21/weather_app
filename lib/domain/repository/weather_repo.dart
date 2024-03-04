
import 'package:weather_app/domain/models/weather_model.dart';

abstract class WeatherRepo {
  Future<WeatherModel> fetchData({required String cityName});
}