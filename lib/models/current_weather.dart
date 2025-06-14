
class CurrentWeather {
  late String _city;
  late String _description;
  late double _currentTemp;
  late DateTime _currentTime;
  late DateTime _sunrise;
  late DateTime _sunset;

  String get city {
    return _city;
  }

  set city(String value){
    if(value.trim().isEmpty) {
      throw Exception('City cannot be empty');
    }
    _city = value;
  }

  String get description {
    return _description;
  }

  set description(String value){
    if(value.trim().isEmpty) {
      throw Exception('Description cannot be empty');
    }
    _description = value;
  }

  double get currentTemp {
    return _currentTemp;
  }

  set currentTemp(double value){
    if(value < -100 || value > 100) {
      throw Exception('Temperature must be between -100 and 100');
    }
    _currentTemp = value;
  }

  DateTime get currentTime {
    return _currentTime;
  }

  set currentTime(DateTime value){
    if(value.isAfter(DateTime.now())) {
      throw Exception('Current time cannot be in the future');
    }
    _currentTime = value;
  }

  DateTime get sunrise {
    return _sunrise;
  }

  set sunrise(DateTime value){
    if(value.year != _currentTime.year || value.month != _currentTime.month ||
        value.day != _currentTime.day) {
      throw Exception('Sunrise must be on the same day as current time');
    }

    if(value.isAfter(_sunset)) {
      throw Exception('Sunrise cannot be after sunset');
    }
    _sunrise = value;
  }

  DateTime get sunset {

    return _sunset;
  }

  set sunset(DateTime value){
    if(value.year != _currentTime.year || value.month != _currentTime.month ||
        value.day != _currentTime.day) {
      throw Exception('Sunset must be on the same day as current time');
    }

    if(value.isBefore(_sunrise)) {
      throw Exception('Sunset cannot be before sunrise');
    }
    _sunset = value;
  }


  CurrentWeather({required String city, required String description, required double currentTemp,
      required DateTime currentTime, required DateTime sunrise, required DateTime sunset}){
    this.city = city;
    this.description = description;
    this.currentTemp = currentTemp;
    this.currentTime = currentTime;
    _sunset = sunset;
    this.sunrise = sunrise;
    this.sunset = sunset;
  }

  factory CurrentWeather.fromOpenWeatherData(dynamic data) {
    return CurrentWeather(city: data['name'] ?? '',
                          description: data['weather'][0]['description'] ?? '',
                          currentTemp: (data['main']['temp'] as num).toDouble(),
                          currentTime: DateTime.fromMillisecondsSinceEpoch((data['dt'] as num).toInt() * 1000, isUtc: true).toLocal(),
                          sunrise: DateTime.fromMillisecondsSinceEpoch((data['sys']['sunrise'] as num).toInt() * 1000, isUtc: true).toLocal(),
                          sunset: DateTime.fromMillisecondsSinceEpoch((data['sys']['sunset'] as num).toInt() * 1000, isUtc: true).toLocal());
  } // I have not found any info about factory constructors on your workbooks, so I went for information on main dart website
  @override
  String toString() {
      return 'City: $_city, Description: $_description, Current Temperature: $_currentTemp, Current Time: $_currentTime, Sunrise: $_sunrise, Sunset: $_sunset';
  }
}