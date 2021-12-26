import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techtree/bloc/weather/weather_entity.dart';
import 'package:techtree/bloc/weather/weather_events.dart';
import 'package:techtree/bloc/weather/weather_states.dart';
import 'package:http/http.dart' as http;
import 'package:techtree/bloc/weather/weather_vo.dart';
import 'package:techtree/services/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherStates> {
  WeatherRepository repository;

  WeatherBloc({required this.repository}) : super(WeatherDefault());

  @override
  Stream<WeatherStates> mapEventToState(WeatherEvent event) async* {
    try {
      if (event is WeatherApiEvent) {
        final response = await http.get(event.uri);

        if (response.statusCode == 200) {
          WeatherEntity weatherEntity = WeatherEntity().fromJson(json.decode(response.body));
          WeatherVo weather = WeatherVo.entityToVo(weatherEntity);

          yield WeatherSuccess(weatherVo: weather);
        } else {
          yield WeatherFail(message: response.body);
        }
      }
    } catch (e) {
      yield WeatherFail(message: e.toString());
    }
  }
}