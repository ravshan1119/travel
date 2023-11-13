import 'package:flutter/material.dart';
import 'package:travel/src/utils/extensions/size_extension.dart';
import 'package:travel/src/utils/resources/app_images.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            AppImages.onboarding02,
            fit: BoxFit.cover,
          ),
        ),
        18.h,
        const Text(
          "Rencuentrate",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Color(0xff16056b),
            height: 27 / 28,
          ),
          textAlign: TextAlign.center,
        ),
        16.h,
        const Text(
          "¡Con tus seres queridos o mascotas!",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff16056b),
            height: 16 / 14,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
