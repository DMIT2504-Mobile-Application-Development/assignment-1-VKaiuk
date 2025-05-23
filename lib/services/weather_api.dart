import 'dart:convert';
import 'package:http/http.dart' as http;

const weatherApiKey = 'c7b75dcfcfc0df18176181947f3115c9';
const currentWeatherEndpoint = 'https://api.openweathermap.org/data/2.5/weather';

Future<dynamic> getWeatherForCity({required String city}) async {
  final api = '$currentWeatherEndpoint?units=metric&q=$city&appid=$weatherApiKey';

  try {
    final res = await http.get(Uri.parse(api));

    if(res.statusCode != 200){
      throw Exception('There was a problem with the request: status ${res.statusCode} received');
    }
    else {
      final data = jsonDecode(res.body);
      return data;
    }
  }
  catch(e) {
    throw Exception('There was a problem with the request: $e');
  }

}

