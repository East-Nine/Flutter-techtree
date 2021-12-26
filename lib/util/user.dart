import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String _PREFS_UID = 'uid';
final String _PREFS_NAME = 'name';
final String _PREFS_EMAIL = 'email';
final String _PREFS_PROFILE = 'profile';

Future<void> saveUser(User user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(_PREFS_UID, user.uid);
  await prefs.setString(_PREFS_NAME, user.displayName ?? '');
  await prefs.setString(_PREFS_EMAIL, user.email ?? '');
  await prefs.setString(_PREFS_PROFILE, user.photoURL ?? '');
}

Future<String?> getUid() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(_PREFS_UID);
}