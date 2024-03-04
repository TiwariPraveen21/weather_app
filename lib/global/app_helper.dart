import 'package:flutter/material.dart';

String getGreetingFromTimestamp(int timestamp) {
  // Convert timestamp to DateTime
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  // Extract the hour
  int hour = dateTime.hour;

  // Determine the time of day and return the corresponding greeting
  if (hour >= 6 && hour < 12) {
    return "Good Morning";
  } else if (hour >= 12 && hour < 18) {
    return "Good Afternoon";
  } else if (hour >= 18 && hour < 24) {
    return "Good Evening";
  } else {
    return "Good Night";
  }
}

//Enum to show image of weather status
enum WeatherCondition { Clouds, Mist, Clear, Fogg }

WeatherCondition getWeatherCondition(String main) {
  final lowerCaseMain = main.toLowerCase();
  if (lowerCaseMain.contains("clouds")) {
    return WeatherCondition.Clouds;
  } else if (lowerCaseMain.contains("mist")) {
    return WeatherCondition.Mist;
  } else if (lowerCaseMain.contains("clear")) {
    return WeatherCondition.Clear;
  } else if (lowerCaseMain.contains("fogg")) {
    return WeatherCondition.Fogg;
  } else {
    return WeatherCondition.Clear;
  }
}

Widget buildWeatherImage(WeatherCondition condition) {
  switch (condition) {
    case WeatherCondition.Clouds:
      return Center(
        child: Image.asset(
          "assets/images/8.png",
          height: 200,
        ),
      );
    case WeatherCondition.Mist:
      return Center(
        child: Image.asset(
          "assets/images/2.png",
          height: 200,
        ),
      );
    case WeatherCondition.Clear:
      return Center(
        child: Image.asset(
          "assets/images/6.png",
          height: 200,
        ),
      );

    case WeatherCondition.Fogg:
      return Center(
        child: Image.asset(
          "assets/images/fogg.png",
          height: 200,
        ),
      );
    default:
      return Center(
          child: Image.asset(
        "assets/images/6.png",
        height: 200,
      ));
  }
}
