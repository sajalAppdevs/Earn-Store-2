import 'dart:async';

import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/onboard_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    splashEnding();
  }

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlassmorphismCard(
            boxHeight: 190.h,
            boxWidth: 220.w,
            isCenter: true,
            childAlignment: Alignment.center,
            child: Image.asset(
              "${Paths.iconPath}splash_logo.png",
              height: 102.h,
              width: 92.w,
            ),
          ),
        ],
      ),
    );
  }

  void splashEnding() {
    Timer(
      const Duration(seconds: 3),
      () => Get.offAll(
        const OnboardPage(),
      ),
    );
  }
}
