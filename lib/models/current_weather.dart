
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
  }
  
  String get description {
    return _description;
  }

  double get currentTemp {
    return _currentTemp;
  }

  DateTime get currentTime {
    return _currentTime;
  }

  DateTime get sunrise {
    return _sunrise;
  }

  DateTime get sunset {
    return _sunset;
  }

}