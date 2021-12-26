import 'package:techtree/bloc/weather/weather_vo.dart';

abstract class WeatherStates {}

class WeatherDefault extends WeatherStates {}

class WeatherSuccess extends WeatherStates {
  WeatherVo weatherVo;

  WeatherSuccess({required this.weatherVo});
}

class WeatherFail extends WeatherStates {
  String message;

  WeatherFail({required this.message});
}