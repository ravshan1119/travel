import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/src/config/router/app_routes.dart';
import 'package:travel/src/presentation/cubits/auth/auth_cubit.dart';
import 'package:travel/src/presentation/widgets/global_button.dart';
import 'package:travel/src/presentation/widgets/global_input.dart';
import 'package:travel/src/utils/extensions/size_extension.dart';
import 'package:travel/src/utils/resources/app_colors.dart';
import 'package:travel/src/utils/resources/app_icons.dart';
import 'package:travel/src/utils/resources/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
            children: [
              const ColoredBox(color: AppColors.c_FFF6E9),
              ListView(
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
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: GlobalTextField(hintText: "Name"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: GlobalTextField(
                      hintText: "Email",
                      controller: emailController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: GlobalTextField(
                      hintText: "Password",
                      controller: passwordController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GlobalButton(
                        title: "Sign Up",
                        onTap: () async {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            await context.read<AuthCubit>().emailAndPassword(
                                emailController.text, passwordController.text);
                            if (context.mounted) {
                              context.goNamed(AppRoutes.homeScreen);
                            }
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Iltimos to'ldiring!"),
                            ));
                          }
                        }),
                  ),
                  ZoomTapAnimation(
                    onTap: () async {
                      await context.read<AuthCubit>().signInWithGoogle();
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool("login", true);

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
