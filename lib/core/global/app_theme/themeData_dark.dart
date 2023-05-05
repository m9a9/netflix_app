import 'package:flutter/material.dart';
import 'package:netflix_app/core/global/app_colors/dark_theme_colors.dart';

ThemeData getDarkThemeData() => ThemeData(
      brightness: Brightness.dark,
      primaryColor: DarkThemeColors.primaryColor,
      scaffoldBackgroundColor: DarkThemeColors.backgroundColor,
    );
