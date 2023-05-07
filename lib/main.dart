import 'package:flutter/material.dart';
import 'package:netflix_app/Features/Movies/Data/Data%20Source/movies_remote_data_source.dart';
import 'package:netflix_app/Features/OnBoarding/Views/onBoarding_homeView.dart';
import 'package:netflix_app/core/global/app_theme/themeData_dark.dart';

void main() {
  runApp(const MyApp());
  MoviesRemoteDataSource? moviesRemoteDataSource;
  print(moviesRemoteDataSource!.getNowPlayingMovies());
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
