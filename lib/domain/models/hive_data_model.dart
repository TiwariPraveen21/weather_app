import 'package:hive/hive.dart';
part "hive_data_model.g.dart";
@HiveType(typeId: 0)
class HiveDataModel extends HiveObject{
  
  @HiveField(0)
  final String locationName;
  @HiveField(1)
  final int time;
  @HiveField(2)
  final int dataAndTime;
  @HiveField(3)
  final double temp;
  @HiveField(4)
  final double maxTemp;
  @HiveField(5)
  final double minTemp;
  @HiveField(6)
  final int sunrise;
  @HiveField(7)
  final int sunset;
  @HiveField(8)
  final String? weatherCondition;
 

  HiveDataModel({
  required this.locationName, 
  required this.time, 
  required this.dataAndTime,
   required this.temp, 
   required this.maxTemp, 
   required this.minTemp, 
   required this.sunrise, 
   required this.sunset,
   required this.weatherCondition
   });
}