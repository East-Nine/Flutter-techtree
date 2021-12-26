import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techtree/bloc/sign/sign_in_events.dart';
import 'package:techtree/bloc/sign/sign_in_states.dart';
import 'package:techtree/services/sign_in_repository.dart';

class SignInBloc extends Bloc<SignInEvent, SignInStates> {
  final SignInRepository repository;

  SignInBloc({required this.repository}) : super(SignInDefault());

  @override
  Stream<SignInStates> mapEventToState(SignInEvent event) async* {
    try {
      UserCredential? credential;
      if (event is SignInEmailEvent) {
        credential = await repository.emailLogin(event.email, event.password);
      } else if (event is SignInGoogleChangeEvent) {
        credential = await repository.googleLogin();
      } else if (event is SignInFacebookChangeEvent) {
        credential = await repository.facebookLogin();
      }

      if (credential == null) {
        yield SignInFail(message: 'No user found.');
      } else {
        User? user = credential.user;

        if (user == null) {
          yield SignInFail(message: 'sign in error: user is null');
        } else {
          yield SignInSuccess(user: user);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        yield SignInFail(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        yield SignInFail(message: 'Wrong password provided for that user.');
      } else {
        yield SignInFail(message: e.code);
      }
    }
  }
}