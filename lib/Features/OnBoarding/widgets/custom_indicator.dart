import 'package:flutter/material.dart';

import '../../../core/global/app_colors/dark_theme_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.cindex});
  final int cindex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          width: index == cindex ? 20 : 8,
          height: 15,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: cindex == index ? DarkThemeColors.primaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }
}
