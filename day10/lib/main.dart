import 'package:bmiapp/pages/daily_task.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});






  @override  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromRGBO(59, 66, 74, 1),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(59, 66, 74, 1),
          shadowColor: Colors.black,
          elevation: 0.5
        )
      ),
      home: DailyTask(),
    );
  }
}
