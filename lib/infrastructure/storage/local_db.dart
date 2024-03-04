import 'package:hive/hive.dart';
import 'package:weather_app/domain/models/hive_data_model.dart';

class LocalDataBase{
  static Box<HiveDataModel> getData() => Hive.box<HiveDataModel>("HiveWeatherData");
}