import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/application/weatherBloc/weather_bloc.dart';
import 'package:weather_app/application/weatherBloc/weather_event.dart';
import 'package:weather_app/application/weatherBloc/weather_state.dart';
import 'package:weather_app/global/app_helper.dart';
import 'package:weather_app/presentation/custom_widgets/home_tile_widget.dart';
import 'package:weather_app/presentation/custom_widgets/internet_lost_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherBloc weatherBloc = WeatherBloc();

  @override
  void initState() {
    weatherBloc.add(WeatherInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        bloc: weatherBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          }
         else if (state is WeatherSuccessState) {
            final weatherData = state.weatherData;
            String greeting = getGreetingFromTimestamp(weatherData.dt!);
            WeatherCondition condition = getWeatherCondition(weatherData.weather!.first.main!);
            Widget weatherImage = buildWeatherImage(condition);
            return HomeTileWidget(weatherData: weatherData, greeting: greeting, weatherImage: weatherImage);
          } else if(state is WeatherErrorState){
            return Center(child: Text(state.errormsg));
          }
          else if(state is InternetLostState){
            final weatherData = state.userHiveData;
            String greeting = getGreetingFromTimestamp(weatherData!.time);
           WeatherCondition condition = getWeatherCondition(weatherData.weatherCondition!);
           Widget weatherImage = buildWeatherImage(condition);
           debugPrint("IMage"+weatherImage.toString());
           return InternetLostHomeScreen(weatherData: weatherData, greeting: greeting, weatherImage: weatherImage);
          }
          else {
            return Container();
          }
        },
      ),
    );
  }

}






