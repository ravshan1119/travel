import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel/src/utils/extensions/size_extension.dart';
import 'package:travel/src/utils/resources/app_colors.dart';

class TravelItem extends StatefulWidget {
  const TravelItem(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  final String title;
  final String description;
  final String image;

  @override
  State<TravelItem> createState() => _TravelItemState();
}

class _TravelItemState extends State<TravelItem> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 120,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: widget.image,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            10.h,
            Text(
              widget.title,
              style: const TextStyle(
                fontFamily: "Montserrat",
                fontSize: 9,
                fontWeight: FontWeight.w400,
                color: AppColors.c_16056b,
              ),
              textAlign: TextAlign.left,
            ),
            8.h,
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.c_16056b,
              ),
              textAlign: TextAlign.left,
            ),
            8.h,
            Stack(
              children: [
                RatingBar.builder(
                  unratedColor: Colors.grey,
                  glowColor: AppColors.greysCale,
                  itemSize: 22.0,
                  initialRating: initialRating,
                  direction: isVertical ? Axis.vertical : Axis.horizontal,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return const Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                          size: 8.0,
                        );
                      case 1:
                        return const Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                          size: 8.0,
                        );
                      case 2:
                        return const Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                          size: 8.0,
                        );
                      case 3:
                        return const Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.lightGreen,
                          size: 8.0,
                        );
                      case 4:
                        return const Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.green,
                          size: 8.0,
                        );
                      default:
                        return const ColoredBox(
                          color: AppColors.greysCale,
                        );
                    }
                  },
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                  updateOnDrag: true,
                ),
              ],
            ),
            10.h,
          ],
        ),
      ),
    );
  }
}
