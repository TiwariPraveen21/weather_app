// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDataModelAdapter extends TypeAdapter<HiveDataModel> {
  @override
  final int typeId = 0;

  @override
  HiveDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDataModel(
      locationName: fields[0] as String,
      time: fields[1] as int,
      dataAndTime: fields[2] as int,
      temp: fields[3] as double,
      maxTemp: fields[4] as double,
      minTemp: fields[5] as double,
      sunrise: fields[6] as int,
      sunset: fields[7] as int,
      weatherCondition: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveDataModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.locationName)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.dataAndTime)
      ..writeByte(3)
      ..write(obj.temp)
      ..writeByte(4)
      ..write(obj.maxTemp)
      ..writeByte(5)
      ..write(obj.minTemp)
      ..writeByte(6)
      ..write(obj.sunrise)
      ..writeByte(7)
      ..write(obj.sunset)
      ..writeByte(8)
      ..write(obj.weatherCondition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
