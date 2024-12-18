import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/weather_model.dart';
import '../providers/weather_provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  // String city;

  const HomePage({super.key});
// ,this.weatherResult
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherResult;
  @override
  Widget build(BuildContext context) {
    weatherResult = Provider.of<WeatherProvider>(context).weatherData;
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            return weatherBox(weatherResult);
          },
          future: null,
          // future: fetchAlbum(widget.city)
        ),
      ),
    ));
  }
}

Widget weatherBox(WeatherModel? weathry) {
  return weathry == null
      ? const Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ]))
      : Center(
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 300, 10, 10),
                  child: Text(
                    "${weathry.temp}°C",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 50.0),
                  )),
              Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(weathry.description)),
              Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Feels: ${weathry.feelsLike}°C")),
              Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("H:${weathry.tempMax}°C L:${weathry.tempMin}°C"))
            ],
          ),
        );
}
