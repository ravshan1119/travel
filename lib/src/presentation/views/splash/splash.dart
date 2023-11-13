import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel/src/config/router/app_routes.dart';
import 'package:travel/src/utils/resources/app_colors.dart';
import 'package:travel/src/utils/resources/app_icons.dart';
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
      backgroundColor: AppColors.c_F2EDFE,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.c_F2EDFE),
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 50,
            right: 0,
            left: 0,
            child: SvgPicture.asset(AppIcons.air),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              AppImages.splash,
              fit: BoxFit.cover,
            ),
          )
        ],
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
