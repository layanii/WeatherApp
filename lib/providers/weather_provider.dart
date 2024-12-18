import 'package:flutter/widgets.dart';
import 'package:task5/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;

  set weatherData(WeatherModel? w) {
    _weatherData = w;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
