import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel/src/config/router/app_routes.dart';
import 'package:travel/src/presentation/views/onboarding/pages/page_one.dart';
import 'package:travel/src/presentation/views/onboarding/pages/page_there.dart';
import 'package:travel/src/presentation/views/onboarding/pages/page_two.dart';
import 'package:travel/src/utils/constants/app_constants.dart';
import 'package:travel/src/utils/resources/app_colors.dart';
import 'package:travel/src/utils/resources/app_icons.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int index = 0;
  int current = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 150,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: dots.map((b) {
                int index = dots.indexOf(b);
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(top: 16, left: 6, right: 6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: current == index
                        ? AppColors.green
                        : AppColors.black.withOpacity(0.2),
                  ),
                );
              }).toList(),
            ),
          ),
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                this.index = index;
                current = index;
              });
            },
            children: const [
              PageOne(),
              PageTwo(),
              PageThere(),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: ZoomTapAnimation(
                onTap: () {
                  if (index < 2) {
                    setState(() {
                      print("object");
                      index++;
                      current = index;
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    });
                  } else {
                    context.go(AppRoutes.signInScreen);
                  }
                },
                child: SvgPicture.asset(AppIcons.nextButton)),
          ),
        ],
      ),
    );
  }
}
