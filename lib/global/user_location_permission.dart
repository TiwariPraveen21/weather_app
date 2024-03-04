import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

 String cityName = "";
Future<void> requestLocationPermissions() async {
  LocationPermission permission = await Geolocator.requestPermission();

  if (permission == LocationPermission.denied) {
    await Geolocator.requestPermission();
  } else if (permission == LocationPermission.deniedForever) {
    await Geolocator.openAppSettings();
  } else {
    // Permission granted, fetch current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Fetch city name based on latitude and longitude
    cityName = await getCityName(position.latitude, position.longitude);

    // Handle the obtained city name as needed
    debugPrint('City Name: $cityName');
  }
}



Future<String> getCityName(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      // Use locality as the city name
      return placemark.locality ?? ''; 
    } else {
      // Handle case where no placemarks are available
      return 'Noida'; 
    }
  } catch (e) {
    debugPrint('Error getting city name: $e');
   // AppUtils.showErrorMessage('Error getting city name: $e');
    return ''; // Handle error
  }
}

