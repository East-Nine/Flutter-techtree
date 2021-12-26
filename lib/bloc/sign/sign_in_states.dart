import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInStates {}

class SignInDefault extends SignInStates {}

class SignInSuccess extends SignInStates {
  User user;

  SignInSuccess({required this.user});
}

class SignInFail extends SignInStates {
  String message;

  SignInFail({required this.message});
}