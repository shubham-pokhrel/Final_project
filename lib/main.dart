// @dart=2.9
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'pages/Login.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new SecondScreen(),
      image: new Image.asset('assets/mountainelogo 3.png'),
      loaderColor: Colors.blue,
      title: Text(
        'Loading...',
        textScaleFactor: 1.5,
      ),
      //loadingText: Text("Loading"),
      photoSize: 100.0,
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var _phone;

  @override
  void initState() {
    // TODO: implement initState
    get_data();
    super.initState();
  }

  void get_data() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _phone = _prefs.getString("password") ?? "";
    print(_phone);
  }

  @override
  Widget build(BuildContext context) {
    if (_phone == null) {
      return Login1();
    } else {
      //  print('home');
      return Homepage();
    }
  }
}
