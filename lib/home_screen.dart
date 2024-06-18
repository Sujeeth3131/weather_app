import 'package:flutter/material.dart';
import 'package:weatherapp/weather_service.dart';
class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  final WeatherService _weatherService=WeatherService();
  String _city="London";
  Map<String,dynamic>? _currentWeather;

  @override
  void initState(){
    super.initState();
    _fetchWeather();
  }

  Future<void>_fetchWeather()async{
    try{
      final weatherData=await _weatherService.fetchCurrentWeather(_city);
      setState(() {
        _currentWeather=weatherData;
      });
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();

  }



  }



