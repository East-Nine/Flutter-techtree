import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  static User? getUser() =>
      FirebaseAuth.instance.currentUser;

  static String getUserName(BuildContext context) {
    User? user = getUser();
    if (user == null) {
      Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (route) => false);
      return '';
    } else {
      String? displayName = user.displayName;
      String? email = user.email;
      String? creationTime = user.metadata.creationTime?.millisecond.toString();
      if (displayName != null && displayName.isNotEmpty) {
        return displayName;
      } else if (email != null && email.isNotEmpty) {
        return email;
      } else if (creationTime != null && creationTime.isNotEmpty) {
        return 'User $creationTime';
      } else {
        return '';
      }
    }
  }
}