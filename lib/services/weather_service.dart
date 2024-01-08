import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService{
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "a01ada8bbff649f4ae505242232007";
 Future<WeatherModel> getWeather({required String cityName}) async {
   WeatherModel weatherObject;
    Uri uri = Uri.parse(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
    http.Response response = await http.get(uri);
    Map<String, dynamic> data = jsonDecode(response.body);
     weatherObject = WeatherModel.fromJson(data);
    return weatherObject;
}
}