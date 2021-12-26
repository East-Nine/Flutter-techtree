import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techtree/bloc/weather/weather_bloc.dart';
import 'package:techtree/bloc/weather/weather_events.dart';
import 'package:techtree/bloc/weather/weather_states.dart';
import 'package:techtree/bloc/weather/weather_vo.dart';
import 'package:techtree/services/weather_repository.dart';
import 'package:techtree/util/util.dart';

class Weather extends StatefulWidget {

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final WeatherRepository _repository = WeatherRepository();
  WeatherVo? weather;

  @override
  Widget build(BuildContext context) =>
      BlocProvider<WeatherBloc> (
        create: (_) => WeatherBloc(repository: _repository),
        child: BlocBuilder<WeatherBloc, WeatherStates>(
          builder: (context, state) {
              if (state is WeatherSuccess) {
                weather = state.weatherVo;
              } else if (state is WeatherFail) {
                print(state.message);
              }

              searchToMe(context);

            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: weather?.icon ?? "",
                          placeholder: (context, url) => Image.asset("resource/drawable/ic_bad.png"),
                          errorWidget: (context, url, error) => Image.asset("resource/drawable/ic_bad.png"),
                          fadeInDuration: Duration(milliseconds: 100),
                          fadeOutDuration: Duration(milliseconds: 100),
                          fit: BoxFit.contain,
                          width: 120.0,
                          height: 120.0,
                        ),
                        Text(
                          (weather?.temp.toStringAsFixed(2) ?? '') + '°',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 48
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          weather?.week ?? "",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16),
                        ),
                        Text(
                          weather?.date ?? "",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Text(
                            weather?.time ?? "",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ),
            );
          }
          ),
      );

  Uri setUriFromPosition(double lat, double lon) =>
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=637f5d9e5f418aa11b95f7e7f18f8de3');

  void searchToMe(BuildContext context) {
    Util.geolocation()
        .then(
            (position) {
              Uri uri = setUriFromPosition(position.latitude, position.longitude);
              return BlocProvider.of<WeatherBloc>(context).add(WeatherApiEvent(uri: uri));
            }
        )
        .onError((error, stackTrace) => print(error))
        .catchError((error) => print(error));
  }
}