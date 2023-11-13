import 'package:flutter/material.dart';
import 'package:travel/src/utils/extensions/size_extension.dart';
import 'package:travel/src/utils/resources/app_images.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            AppImages.onboarding01,
            fit: BoxFit.cover,
          ),
        ),
        18.h,
        RichText(
          text: const TextSpan(
            text: 'Planifica',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xff16056b),
            ),
            children: <TextSpan>[
              TextSpan(
                  text: ' tu Viaje',
                  style: TextStyle(fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        16.h,
        const Text(
          "De manera simple",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff16056b),
            height: 16/14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
