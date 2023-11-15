import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel/src/config/router/app_routes.dart';
import 'package:travel/src/presentation/cubits/auth/auth_cubit.dart';
import 'package:travel/src/utils/extensions/size_extension.dart';
import 'package:travel/src/utils/resources/app_colors.dart';
import 'package:travel/src/utils/resources/app_icons.dart';
import 'package:travel/src/utils/resources/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Stack(
            children: [
              const ColoredBox(color: AppColors.c_FFF6E9),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  35.h,
                  SizedBox(
                    height: 165,
                    width: double.infinity,
                    child: Image.asset(AppImages.login, fit: BoxFit.cover),
                  ),
                  28.h,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Salom, 👋",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppColors.c_16056b,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  9.h,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Hush kelibsiz O'zbekistonga!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c_16056b,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  47.h,
                  ZoomTapAnimation(
                    onTap: () async {
                      await context.read<AuthCubit>().signInWithGoogle();
                      if (context.mounted) {
                        context.goNamed(AppRoutes.homeScreen);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: const BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(AppIcons.google),
                            const Text(
                              "Google orqali kirish",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Text(""),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                right: 16,
                top: 50,
                child: ZoomTapAnimation(
                  onTap: () {},
                  child: SvgPicture.asset(AppIcons.x),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
