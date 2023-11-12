import 'package:flutter/material.dart';
import 'package:travel/src/utils/resources/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Center(
          child: Image.asset(AppImages.logo),
        ));
  }
}
