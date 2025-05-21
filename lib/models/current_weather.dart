
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
      throw Exception('Sunset cannot be after sunset');
    }
    _sunset = value;
  }
}