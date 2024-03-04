import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/models/weather_model.dart';
import 'package:weather_app/presentation/custom_widgets/container_filter.dart';
import 'package:weather_app/presentation/custom_widgets/home_background.dart';
import 'package:weather_app/presentation/custom_widgets/temp_sunrise.dart';

class HomeTileWidget extends StatelessWidget {
  const HomeTileWidget({
    super.key,
    required this.weatherData,
    required this.greeting,
    required this.weatherImage,
  });

  final WeatherModel weatherData;
  final String greeting;
  final Widget weatherImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [  
            const HomeBackground(
              xdirection: 3.0,
              yDirection: -0.3,
              height: 300,
              width: 300,
              shape: BoxShape.circle,
              color: Colors.deepPurple,
            ),
            const HomeBackground(
              xdirection: -3.0,
              yDirection: -0.3,
              height: 300,
              width: 300,
              shape: BoxShape.circle,
              color: Color(0xFF673AB7),
            ),
            const HomeBackground(
              xdirection: 0.0,
              yDirection: -1.2,
              height: 300,
              width: 600,
              shape: BoxShape.circle,
              color: Color(0xFFFFAB40),
            ),
           
           //Apply blur filter on container
            const ContainerFilter(),
    
            //show location and Greeting
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📍 ${weatherData.name}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  greeting,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
    
                //show image of weather condition
                weatherImage,
                
              // show current temp,status, date and time
                Center(
                  child: Text(
                    '${weatherData.main!.temp!.toStringAsFixed(0)}°C',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    weatherData.weather!.first.main!.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Text(
                    DateFormat('EEEE dd •').add_jm().format(
                        DateTime.fromMillisecondsSinceEpoch(
                            weatherData.dt! * 1000)),
                    // DateFormat.yMMMMEEEEd().format(DateTime.fromMillisecondsSinceEpoch(weatherData.dt! * 1000)),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                
                //Divider
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
    
                //Min and Max Temperature
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TempAndSunrise(
                      img: 'assets/images/13.png',
                      heading: 'Temp Max',
                      temp:
                          '${weatherData.main!.tempMax!.toString()}°C',
                    ),
                    TempAndSunrise(
                      img: 'assets/images/14.png',
                      heading: 'Temp Min',
                      temp:
                          '${weatherData.main!.tempMin!.toString()}°C',
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                
                //Sunrise and Sunset Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TempAndSunrise(
                      img: 'assets/images/11.png',
                      heading: 'Sunrise',
                      temp: DateFormat().add_jm().format(
                          DateTime.fromMillisecondsSinceEpoch(
                              weatherData.sys!.sunrise! * 1000)),
                    ),
                    TempAndSunrise(
                      img: 'assets/images/12.png',
                      heading: 'Sunset',
                      temp: DateFormat().add_jm().format(
                          DateTime.fromMillisecondsSinceEpoch(
                              weatherData.sys!.sunset! * 1000)),
                    ),
                  ],
                ),
    
              ],
            ),
          ],
        ),
      ),
    );
  }
}