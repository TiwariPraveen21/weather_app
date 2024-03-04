import 'package:weather_app/domain/models/hive_data_model.dart';
import 'package:weather_app/domain/models/weather_model.dart';

abstract class WeatherState{}

 class WeatherInitialState extends WeatherState{}

 class WeatherSuccessState extends WeatherState{
  //  final List<WeatherModel> weatherData;
  final WeatherModel weatherData;

  WeatherSuccessState({required this.weatherData});
}

 class WeatherErrorState extends WeatherState{
  final String errormsg;

  WeatherErrorState({required this.errormsg});
  
}

class InternetLostState extends WeatherState{
   final  HiveDataModel? userHiveData;

  InternetLostState({required this.userHiveData});
}

class InternetGainedState extends WeatherState{}