import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:techtree/ui/home/main_page.dart';
import 'package:techtree/ui/sign/sign_in.dart';
import 'package:techtree/ui/sign/sign_up.dart';

class MainComponent {

  /// Route 설정
  static Map<String, WidgetBuilder> appRoutes() => {
    '/sign_in' : (_) => SignIn(),
    '/sign_up' : (_) => SignUp(),
    '/find_password' : (_) => SignIn(),
    '/main' : (_) => MainPage(),
  };

  /// firebase 설정
  static Future<void> firebaseAuth() async {
    FirebaseOptions options = FirebaseOptions(
      appId: 'appId',
      apiKey: 'apiKey',
      projectId: 'projectId',
      messagingSenderId: 'messagingSenderId',
    );
    await Firebase.initializeApp(options: options);
  }

  /// 언어 설정
  static final _supportedLocales = [
    Locale('en', 'US'),
    Locale('ko', 'KR')
  ];

  static Widget myLocalization(Widget child) => EasyLocalization(
      child: child,
      supportedLocales: _supportedLocales,
      fallbackLocale: Locale('ko', 'KR'),
      path: 'resource/translations'
  );
}