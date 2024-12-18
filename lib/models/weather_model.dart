class WeatherModel {
  late String name;
  final double temp;
  final String description;
  final double feelsLike;
  final double tempMin;
  final double tempMax;

  WeatherModel(
      {required this.temp,
      required this.description,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      feelsLike: json['main']['feels_like'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
    );
  }
}
