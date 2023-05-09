import 'package:flutter/material.dart';
import 'package:netflix_app/core/global/app_theme/themeData_dark.dart';
import 'package:netflix_app/core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: getDarkThemeData(),
    );
  }
}
