import 'package:firstapp/screens/bill_screen.dart';
import 'package:firstapp/screens/bmi_screen.dart';
import 'package:firstapp/screens/intro_screen.dart';
import 'package:firstapp/screens/weather_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GlobeApp());
}

class GlobeApp extends StatelessWidget {
  //const GlobeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi': (context) => BmiScreen(),
        '/weather': (context) => WeatherScreen(),
        '/bill': (context) => BillScreen(),
      },
      initialRoute: '/',
    );
  }
}
