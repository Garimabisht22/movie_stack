import 'package:flutter/material.dart';
import 'package:movie_stack/constants.dart';
import 'package:movie_stack/screens/person_screen.dart';
import 'package:movie_stack/screens/more_information_screen.dart';
import 'package:movie_stack/screens/splash_screen.dart';
import 'movie_service.dart';
import 'screens/home_page.dart';

void main() async {


  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0E21),
        scaffoldBackgroundColor: Color(0xE60A0E21),
      ),
      home: SplashScreen(),
    );
  }
}
