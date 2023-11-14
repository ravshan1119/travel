import 'package:flutter/material.dart';
import 'package:travel/src/presentation/views/home/widgets/travel_item.dart';
import 'package:travel/src/utils/extensions/size_extension.dart';
import 'package:travel/src/utils/resources/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greysCale,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Barcha manzillar",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.c_16056b,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            24.h,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  ...List.generate(
                    10,
                    (index) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TravelItem(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}