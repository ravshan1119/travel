import 'package:flutter/material.dart';
import 'package:travel/src/utils/extensions/size_extension.dart';
import 'package:travel/src/utils/resources/app_colors.dart';
import 'package:travel/src/utils/resources/app_images.dart';

class RatingTopItem extends StatefulWidget {
  const RatingTopItem({super.key});

  @override
  State<RatingTopItem> createState() => _RatingTopItemState();
}

class _RatingTopItemState extends State<RatingTopItem> {
  double initialRating = 0.0;
  late double _rating;
  bool isVertical = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 170,
                width: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(AppImages.imgTop, fit: BoxFit.cover)),
              ),
            ),
            16.w,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.h,
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, color: AppColors.c_16056b),
                    Text(
                      "Samarqand",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.c_16056b,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                8.h,
                const Text(
                  "Madaniyatlar chorrahasi",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: AppColors.c_16056b,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
