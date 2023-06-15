import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const kApiKey = '401add15297079b5c45d283fac92f072';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
    Future<dynamic> getCityWeather(String cityName) async {
    var url = "https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=$kApiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location locations = Location();
    await locations.getCurrentLocation();
    var uri =
        "https://api.openweathermap.org/data/2.5/weather?lat=${locations.latitude}&lon=${locations.longitude}&appid=$kApiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(uri);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

}