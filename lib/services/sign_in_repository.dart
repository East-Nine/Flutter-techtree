import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInRepository {
  Future<UserCredential?> emailLogin(String email, String password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
  }

  Future<UserCredential?> googleLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      return null;
    }
  }

  Future<UserCredential?> facebookLogin() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final String? accessToken = loginResult.accessToken?.token;
    if (accessToken != null) {
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken);
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } else {
      return null;
    }
  }
}