import 'package:intl/intl.dart';
import 'package:techtree/bloc/weather/weather_entity.dart';

class WeatherVo {
	final String icon;
	final double temp;
	final String week;
	final String date;
	final String time;

	WeatherVo({
		required this.icon,
		required this.temp,
		required this.week,
		required this.date,
		required this.time
	});

	factory WeatherVo.entityToVo(WeatherEntity entity) {
		String icon = "";
		if (entity.weather.isNotEmpty) {
			icon = "http://openweathermap.org/img/wn/${entity.weather.first.icon}.png";
		}

		DateTime now = DateTime.now().toLocal();

		return WeatherVo(
			icon: icon,
			temp: (entity.main.temp - 273.15),
			week: DateFormat('EEEE').format(now),
			date: DateFormat('dd MMMM, yyyy').format(now),
			time: DateFormat('hh:mm a').format(now),
		);
	}

}
