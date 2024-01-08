class WeatherModel {
  DateTime date;
  double maxTemp;
  double minTemp;
  double temp;
  String cityNameState;
  String icon;

  WeatherModel(
      {required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.cityNameState,
      required this.icon});

  // named constructor to put api data
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']["forecastday"][0]['day'];

    // without factory (when i convert my variables to nullable)
    // data = data['location']['localtime'];
    // maxTemp = jsonData['maxtemp_c'];
    // minTemp= jsonData['mintemp_c'];
    // temp= jsonData['avgtemp_c'];
    // condition= jsonData['condition']['text'];

    // with factory(convert my variables to nonnullable) cause it return my object
    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        temp: jsonData['avgtemp_c'],
        cityNameState: jsonData['condition']['text'],
        icon: jsonData['condition']['icon']
        );
  }

  @override
  String toString() {
    return "temp = $temp, maxTemp = $maxTemp, minTemp = $minTemp, data = $date";
  }

  String getImage(){
    if(cityNameState == "Clear" || cityNameState == "sunny"  ){
     return "assets/clear.png";
    }
    else if(cityNameState == "Blowing snow" || cityNameState == "Patchy sleet possible" || cityNameState == "Mist"){
      return "assets/snow.png";
    }
    else if(cityNameState == "Partly cloudy" ||cityNameState == "Cloudy" ){
      return "assets/cloudy.png";
    }
    else if(cityNameState == "Patchy rain possible" || cityNameState == "Heavy rain" || cityNameState == "Moderate rain"){
      return "assets/rainy.png";
    }
    else if(cityNameState == "Thundery outbreaks possible"){
      return "assets/thunderstorm.png";
    }
     return "assets/clear.png";
  }

  // MaterialColor getColor(){
  //   if(cityNameState == "Clear" || cityNameState == "Light Cloud"  ){
  //    return Colors.deepOrange;
  //   }
  //   else if(cityNameState == "Snow" || cityNameState == "Sleet" || cityNameState == "Hail"){
  //     return Colors.indigo;
  //   }
  //   else if(cityNameState == "Heavy Cloud"){
  //     return Colors.purple;
  //   }
  //   else if(cityNameState == "Light Rain" || cityNameState == "Heavy Rain" || cityNameState == "Showers"){
  //     return Colors.lightBlue;
  //   }
  //   else if(cityNameState == "Thunder"){
  //     return Colors.cyan;
  //   }
  //    return Colors.deepOrange;
  // }
}
