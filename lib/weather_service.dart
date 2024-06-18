import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:core';



import 'package:http/http.dart' as http;
class WeatherService{
  final String apikey="2fe5c0c911724f0180b93641241806";
  final String forecastBaseUrl="http://api.weatherapi.com/v1/forecast.json";
  final String searchBaseUrl='http://api.weatherapi.com/v1/search.json';



   Future<Map<String,dynamic>> fetchCurrentWeather(String city) async{
     final url='$forecastBaseUrl?key=$apikey&q=$city&days=1&api=no&alerts=no';
     final response =await http.get(Uri.parse(url));
     if(response.statusCode==200){
       return json.decode(response.body);
     }
     else{
       throw Exception("Failed to load weather data");
     }
  }

  Future<Map<String,dynamic>> fetch70DayForecast(String city) async{
    final url='$forecastBaseUrl?key=$apikey&q=$city&days=7&api=no&alerts=no';
    final response =await http.get(Uri.parse(url));
    if(response.statusCode==200){
      return json.decode(response.body);
    }
    else{
      throw Exception("Failedto load weather data");
    }
  }

  Future<List<dynamic>?>fetchCitySuggestions(String query) async{
    final url='$searchBaseUrl?key=$apikey&q=$query';
    final response =await http.get(Uri.parse(url));
    if(response.statusCode==200){
      return json.decode(response.body);
    }
    else{
     return null;
    }
  }


}


