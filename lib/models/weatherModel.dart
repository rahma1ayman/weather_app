class WeatherModel {
  String cityName;
  DateTime date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherCondition;
  String image;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherCondition,
    required this.image,
  });

  factory WeatherModel.fromJason(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
