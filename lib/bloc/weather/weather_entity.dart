import 'package:techtree/generated/json/base/json_convert_content.dart';
import 'package:techtree/generated/json/base/json_field.dart';

class WeatherEntity with JsonConvert<WeatherEntity> {
	late WeatherCoord coord;
	late List<WeatherWeather> weather;
	late String base;
	late WeatherMain main;
	late int visibility;
	late WeatherWind wind;
	late WeatherClouds clouds;
	late int dt;
	late WeatherSys sys;
	late int timezone;
	late int id;
	late String name;
	late int cod;
}

class WeatherCoord with JsonConvert<WeatherCoord> {
	late double lon;
	late double lat;
}

class WeatherWeather with JsonConvert<WeatherWeather> {
	late int id;
	late String main;
	late String description;
	late String icon;
}

class WeatherMain with JsonConvert<WeatherMain> {
	late double temp;
	@JSONField(name: "feels_like")
	late double feelsLike;
	@JSONField(name: "temp_min")
	late double tempMin;
	@JSONField(name: "temp_max")
	late double tempMax;
	late int pressure;
	late int humidity;
}

class WeatherWind with JsonConvert<WeatherWind> {
	late double speed;
	late int deg;
}

class WeatherClouds with JsonConvert<WeatherClouds> {
	late int all;
}

class WeatherSys with JsonConvert<WeatherSys> {
	late int type;
	late int id;
	late String country;
	late int sunrise;
	late int sunset;
}
