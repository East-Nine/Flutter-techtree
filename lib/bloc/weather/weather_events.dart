import 'package:flutter/material.dart';

@immutable
abstract class WeatherEvent {}

class WeatherApiEvent extends WeatherEvent {
  final Uri uri;

  WeatherApiEvent({required this.uri});
}