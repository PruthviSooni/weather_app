import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = 'appid=d59ae40fbd20692117524149e3ae9dd1';
const metric = 'units=metric';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$openWeatherURL?q=$cityName&$apiKey&$metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location gps = Location();
    await gps.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherURL?lat=${gps.latitude}&lon=${gps.longitude}&$apiKey&$metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

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
    if (temp > 35) {
      return 'It\'s 🔥 outside';
    } else if (temp > 30) {
      return 'Time for shorts and 👕';
    } else if (temp < 20) {
      return 'You\'ll need to go out side';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
