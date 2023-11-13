import 'package:flutter/material.dart';
import 'package:travel/src/config/themes/get_theme.dart';
import 'package:travel/src/utils/resources/app_colors.dart';

void showSnackBar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: getTheme(context) ? AppColors.black : AppColors.white,
      content: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ),
  );
}
