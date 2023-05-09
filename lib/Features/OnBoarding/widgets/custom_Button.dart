import 'package:flutter/material.dart';

import '../../../core/global/app_colors/dark_theme_colors.dart';
import '../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height / 12,
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: DarkThemeColors.primaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: Styles.style20.copyWith(letterSpacing: 2.5),
          ),
        ),
      ),
    );
  }
}
