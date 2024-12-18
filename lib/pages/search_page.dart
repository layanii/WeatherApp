import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task5/providers/weather_provider.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import 'home_page.dart';

class SearchPage extends StatelessWidget {
  final myController = TextEditingController();
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          MyText(myController: myController),
          MyBtn(myController: myController)
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MyBtn extends StatelessWidget {
  const MyBtn({
    super.key,
    required this.myController,
  });

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          WeatherService service = WeatherService();
          WeatherModel? weather = await service.getWeather(myController.text);
          Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
          Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent,
        ),
        child: const Text("Search"));
  }
}

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.myController,
  });

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 100, 10, 100),
      child: TextFormField(
        controller: myController,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter city name',
            labelText: 'Search',
            suffixIcon: Icon(Icons.search)),
      ),
    );
  }
}
