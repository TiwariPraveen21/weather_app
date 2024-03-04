import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/models/hive_data_model.dart';
import 'package:weather_app/firebase_options.dart';
import 'package:weather_app/global/user_location_permission.dart';
import 'package:weather_app/infrastructure/provider/password_provider.dart';
import 'package:weather_app/infrastructure/utils/routes/routes.dart';
import 'package:weather_app/infrastructure/utils/routes/routes_name.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
// Request location permission
 await requestLocationPermissions();
 //Initialize hive
 await initializeHive();
  runApp(const MyApp());
}

Future<void> initializeHive() async {
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(HiveDataModelAdapter());
  await Hive.openBox<HiveDataModel>("HiveWeatherData");

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PasswordVisibilityProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ConfirmPasswordVisibilityProvider(),
        ),
         //ChangeNotifierProvider(create:(_) => FirebaseAuthProvider()),
      ],
      child: MaterialApp(
        title: "Info Profile",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 1,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
                backgroundColor: Colors.indigo)),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
