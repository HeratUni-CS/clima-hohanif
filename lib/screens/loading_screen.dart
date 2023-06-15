import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen();

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  WeatherModel  model = WeatherModel();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final data = await model.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      LocationScreen(locationWeather: data);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}