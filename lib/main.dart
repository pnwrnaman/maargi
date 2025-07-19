import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'GetStarted.dart';
import 'screens/places_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize Google Maps
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    (mapsImplementation as GoogleMapsFlutterAndroid).useAndroidViewSurface =
        true;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Explore The Unexplored',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.orange,
          secondary: Colors.blue,
        ),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const GetStartedPage(),
        '/places': (context) => const PlacesScreen(),
      },
    );
  }
}
