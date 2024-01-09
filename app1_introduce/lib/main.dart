import 'package:app1_introduce/home.dart';
import 'package:app1_introduce/introduction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: delay(10), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomeScreen();
          } else {
            return IntroductionScreen();
          }
        },
      ),
    );
  }
}

Future<void> delay(int seconds) {
  return Future.delayed(Duration(seconds: seconds));
}