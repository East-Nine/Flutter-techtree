import 'package:flutter/material.dart';

@immutable
abstract class SignInEvent {}

class SignInEmailEvent extends SignInEvent {
  final String email;
  final String password;

  SignInEmailEvent({required this.email, required this.password});
}

class SignInGoogleChangeEvent extends SignInEvent {}

class SignInFacebookChangeEvent extends SignInEvent {}