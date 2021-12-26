import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techtree/main_components.dart';
import 'package:techtree/util/auth.dart';
import 'package:techtree/util/theme.dart';

const double SIDE_MARGIN = 20;

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainComponent.firebaseAuth();
  await EasyLocalization.ensureInitialized();
  cameras = await availableCameras();

  String initialRoute = '/sign_in';
  User? user = Auth.getUser();
  if (user == null) {
    initialRoute = '/sign_in';
  } else {
    initialRoute = '/main';
  }

  runApp(
      MainComponent.myLocalization(
          MyApp(initialRoute: initialRoute)
      )
  );
}

class MyApp extends StatelessWidget {
  String initialRoute;
  MyApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) =>
    MaterialApp(
      title: 'TechTree',
      theme: mainTheme,
      initialRoute: initialRoute,
      routes: MainComponent.appRoutes(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
}
