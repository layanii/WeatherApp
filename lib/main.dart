import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task5/pages/search_page.dart';
import 'package:task5/providers/weather_provider.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:  (context) => WeatherProvider(),
      child:  MaterialApp(home: SearchPage()) ,
      );
  }
}

