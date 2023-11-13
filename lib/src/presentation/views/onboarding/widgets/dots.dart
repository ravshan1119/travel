import 'package:flutter/material.dart';
import 'package:travel/src/utils/extensions/size_extension.dart';
import 'package:travel/src/utils/resources/app_colors.dart';

class Dots extends StatelessWidget {
  const Dots({super.key, required this.index});
  final int index ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: AppColors.c_E2E7F4,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          5.w,
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: AppColors.c_E2E7F4,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          5.w,
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: AppColors.c_E2E7F4,
              borderRadius: BorderRadius.circular(50),
            ),
          )
        ],
      ),
    );
  }
}
