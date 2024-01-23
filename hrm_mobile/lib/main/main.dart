import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/constants/theme/color_schemes.g.dart';
import 'package:hrm_mobile/core/constants/typography.dart';
import 'package:hrm_mobile/modules/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme, textTheme: textTheme),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

