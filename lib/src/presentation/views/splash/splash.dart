import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel/src/config/router/app_routes.dart';
import 'package:travel/src/utils/resources/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goOnBoanding(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}

goOnBoanding(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 2));
  if (context.mounted) {
    context.go(AppRoutes.onBoarding);
  }
}
