import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel/src/presentation/views/onboarding/pages/page_one.dart';
import 'package:travel/src/presentation/views/onboarding/pages/page_there.dart';
import 'package:travel/src/presentation/views/onboarding/pages/page_two.dart';
import 'package:travel/src/presentation/views/onboarding/widgets/dots.dart';
import 'package:travel/src/utils/resources/app_icons.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SvgPicture.asset(AppIcons.nextButton),
          ),
          Positioned(
              bottom: 150,
              left: 0,
              right: 0,
              child: Dots(
                index: index,
              )),
          PageView(
            onPageChanged: (index) {
              setState(() {
                this.index = index;
              });
            },
            children: const [
              PageOne(),
              PageTwo(),
              PageThere(),
            ],
          )
        ],
      ),
    );
  }
}
