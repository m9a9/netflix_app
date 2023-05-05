import 'package:flutter/material.dart';
import 'package:netflix_app/Features/OnBoarding/Views/onBoarding_homeView.dart';
import 'package:netflix_app/core/global/app_theme/themeData_dark.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getDarkThemeData(),
      home: const OnBoardingHomeView(),
    );
  }
}
