import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/application/weatherBloc/weather_event.dart';
import 'package:weather_app/application/weatherBloc/weather_state.dart';
import 'package:weather_app/domain/models/hive_data_model.dart';
import 'package:weather_app/domain/models/weather_model.dart';
import 'package:weather_app/domain/repository/weather_repo.dart';
import 'package:weather_app/global/user_location_permission.dart';
import 'package:weather_app/infrastructure/repo_impl/weather_repo_impl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weather_app/infrastructure/storage/local_db.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
    HiveDataModel? savedData;
   StreamSubscription? connectivitySubscription;
   final Connectivity _connectivity = Connectivity();
   final box = LocalDataBase.getData();

  WeatherBloc():super(WeatherInitialState()) {

       connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) { 
    if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
      add(InternetGainedEvent());
    }
    else{
      add(InternetLostEvent());
    }
  });

     on<InternetLostEvent>((event, emit) {
      savedData = box.get("HiveWeatherData"); 
     emit(InternetLostState(userHiveData: savedData));
   });
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    on<WeatherInitialEvent>(_getDataFromAPI);
  
  }

// Cancel the subscription to avoid memory leaks
    @override
  Future<void> close() {
    connectivitySubscription?.cancel(); 
    return super.close();
  }
  

  WeatherRepo api = WeatherImplementation();

  Future<void> _getDataFromAPI(WeatherInitialEvent event,Emitter<WeatherState> emit) async {
    try {
       WeatherModel response = await api.fetchData(cityName: cityName);
      if(response.id  != null){
       emit(WeatherSuccessState(weatherData: response));

      
      final hiveData = HiveDataModel(
        locationName: response.name!, 
        time: response.dt!, 
        dataAndTime: response.dt!, 
        temp: response.main!.temp!, 
        maxTemp: response.main!.tempMax!, 
        minTemp: response.main!.tempMin!, 
        sunrise: response.sys!.sunrise!, 
        sunset:response.sys!.sunset!,
        weatherCondition: response.weather!.first.main
        );
       // debugPrint("******************************"+response.weather!.first.main!);
       box.put("HiveWeatherData",hiveData);
       savedData = box.get("HiveWeatherData");  
       debugPrint("My hive data" +savedData!.maxTemp.toString()); 
       debugPrint("My hive data" +savedData!.locationName.toString()); 
      }
      else{
      emit(WeatherErrorState(errormsg: "Unable to Fetch Data"));
      }
    } catch (error) {
       //savedData = await getFromSharedPreferences();
      emit(WeatherErrorState(errormsg: "Unable to fetch Data"));
      debugPrint(error.toString());
    }
  }
}


