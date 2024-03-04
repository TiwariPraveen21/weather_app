import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/infrastructure/services/spash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Container(
          child: Lottie.asset("assets/images/Animation - 1706684392327.json"),
        ),
      ),
    );
  }
}