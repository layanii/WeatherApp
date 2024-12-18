import 'dart:convert';
import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  String baseUrl = "https://api.openweathermap.org/data/2.5";
  String apiKey = "5196e6b872bba17a09eef3ee4b992afb";
  
  Future<WeatherModel?> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse("$baseUrl/weather?q=$cityName&appid=$apiKey&units=metric"));
    WeatherModel? weather ;
    if (response.statusCode == 200) {
      weather = WeatherModel.fromJson(jsonDecode(response.body));
    }
     return weather;
    //  else {
    //   throw Exception('Failed to load album');
    // }
  }
}
