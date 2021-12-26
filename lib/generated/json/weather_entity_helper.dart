
import 'package:techtree/bloc/weather/weather_entity.dart';

weatherEntityFromJson(WeatherEntity data, Map<String, dynamic> json) {
	if (json['coord'] != null) {
		data.coord = WeatherCoord().fromJson(json['coord']);
	}
	if (json['weather'] != null) {
		data.weather = (json['weather'] as List).map((v) => WeatherWeather().fromJson(v)).toList();
	}
	if (json['base'] != null) {
		data.base = json['base'].toString();
	}
	if (json['main'] != null) {
		data.main = WeatherMain().fromJson(json['main']);
	}
	if (json['visibility'] != null) {
		data.visibility = json['visibility'] is String
				? int.tryParse(json['visibility'])
				: json['visibility'].toInt();
	}
	if (json['wind'] != null) {
		data.wind = WeatherWind().fromJson(json['wind']);
	}
	if (json['clouds'] != null) {
		data.clouds = WeatherClouds().fromJson(json['clouds']);
	}
	if (json['dt'] != null) {
		data.dt = json['dt'] is String
				? int.tryParse(json['dt'])
				: json['dt'].toInt();
	}
	if (json['sys'] != null) {
		data.sys = WeatherSys().fromJson(json['sys']);
	}
	if (json['timezone'] != null) {
		data.timezone = json['timezone'] is String
				? int.tryParse(json['timezone'])
				: json['timezone'].toInt();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['cod'] != null) {
		data.cod = json['cod'] is String
				? int.tryParse(json['cod'])
				: json['cod'].toInt();
	}
	return data;
}

Map<String, dynamic> weatherEntityToJson(WeatherEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['coord'] = entity.coord.toJson();
	data['weather'] =  entity.weather.map((v) => v.toJson()).toList();
	data['base'] = entity.base;
	data['main'] = entity.main.toJson();
	data['visibility'] = entity.visibility;
	data['wind'] = entity.wind.toJson();
	data['clouds'] = entity.clouds.toJson();
	data['dt'] = entity.dt;
	data['sys'] = entity.sys.toJson();
	data['timezone'] = entity.timezone;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['cod'] = entity.cod;
	return data;
}

weatherCoordFromJson(WeatherCoord data, Map<String, dynamic> json) {
	if (json['lon'] != null) {
		data.lon = json['lon'] is String
				? double.tryParse(json['lon'])
				: json['lon'].toDouble();
	}
	if (json['lat'] != null) {
		data.lat = json['lat'] is String
				? double.tryParse(json['lat'])
				: json['lat'].toDouble();
	}
	return data;
}

Map<String, dynamic> weatherCoordToJson(WeatherCoord entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['lon'] = entity.lon;
	data['lat'] = entity.lat;
	return data;
}

weatherWeatherFromJson(WeatherWeather data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['main'] != null) {
		data.main = json['main'].toString();
	}
	if (json['description'] != null) {
		data.description = json['description'].toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	return data;
}

Map<String, dynamic> weatherWeatherToJson(WeatherWeather entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['main'] = entity.main;
	data['description'] = entity.description;
	data['icon'] = entity.icon;
	return data;
}

weatherMainFromJson(WeatherMain data, Map<String, dynamic> json) {
	if (json['temp'] != null) {
		data.temp = json['temp'] is String
				? double.tryParse(json['temp'])
				: json['temp'].toDouble();
	}
	if (json['feels_like'] != null) {
		data.feelsLike = json['feels_like'] is String
				? double.tryParse(json['feels_like'])
				: json['feels_like'].toDouble();
	}
	if (json['temp_min'] != null) {
		data.tempMin = json['temp_min'] is String
				? double.tryParse(json['temp_min'])
				: json['temp_min'].toDouble();
	}
	if (json['temp_max'] != null) {
		data.tempMax = json['temp_max'] is String
				? double.tryParse(json['temp_max'])
				: json['temp_max'].toDouble();
	}
	if (json['pressure'] != null) {
		data.pressure = json['pressure'] is String
				? int.tryParse(json['pressure'])
				: json['pressure'].toInt();
	}
	if (json['humidity'] != null) {
		data.humidity = json['humidity'] is String
				? int.tryParse(json['humidity'])
				: json['humidity'].toInt();
	}
	return data;
}

Map<String, dynamic> weatherMainToJson(WeatherMain entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['temp'] = entity.temp;
	data['feels_like'] = entity.feelsLike;
	data['temp_min'] = entity.tempMin;
	data['temp_max'] = entity.tempMax;
	data['pressure'] = entity.pressure;
	data['humidity'] = entity.humidity;
	return data;
}

weatherWindFromJson(WeatherWind data, Map<String, dynamic> json) {
	if (json['speed'] != null) {
		data.speed = json['speed'] is String
				? double.tryParse(json['speed'])
				: json['speed'].toDouble();
	}
	if (json['deg'] != null) {
		data.deg = json['deg'] is String
				? int.tryParse(json['deg'])
				: json['deg'].toInt();
	}
	return data;
}

Map<String, dynamic> weatherWindToJson(WeatherWind entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['speed'] = entity.speed;
	data['deg'] = entity.deg;
	return data;
}

weatherCloudsFromJson(WeatherClouds data, Map<String, dynamic> json) {
	if (json['all'] != null) {
		data.all = json['all'] is String
				? int.tryParse(json['all'])
				: json['all'].toInt();
	}
	return data;
}

Map<String, dynamic> weatherCloudsToJson(WeatherClouds entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['all'] = entity.all;
	return data;
}

weatherSysFromJson(WeatherSys data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type'] is String
				? int.tryParse(json['type'])
				: json['type'].toInt();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['country'] != null) {
		data.country = json['country'].toString();
	}
	if (json['sunrise'] != null) {
		data.sunrise = json['sunrise'] is String
				? int.tryParse(json['sunrise'])
				: json['sunrise'].toInt();
	}
	if (json['sunset'] != null) {
		data.sunset = json['sunset'] is String
				? int.tryParse(json['sunset'])
				: json['sunset'].toInt();
	}
	return data;
}

Map<String, dynamic> weatherSysToJson(WeatherSys entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['id'] = entity.id;
	data['country'] = entity.country;
	data['sunrise'] = entity.sunrise;
	data['sunset'] = entity.sunset;
	return data;
}