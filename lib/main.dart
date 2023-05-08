import 'package:flutter/material.dart';
import 'package:netflix_app/core/global/app_theme/themeData_dark.dart';

import 'Features/Movies/Presentation/Views/top_rated_movies_List.dart';

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
      home: const TopRatedMoviesList(),
    );
  }
}
