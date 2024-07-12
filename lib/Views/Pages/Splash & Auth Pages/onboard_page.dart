import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/auth_top_logo.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/login_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/register_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: Column(
        children: [
          SizedBox(height: 40.h),
          const AuthTopLogo(),
          SizedBox(height: 20.h),
          onboardLogo(),
          SizedBox(height: 10.h),
          TextStyles.customText(
            title: "Discover your\nDream Job Here",
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 15.h),
          TextStyles.customText(
            title: "The Best Online App for\nMaking Money",
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
          const Spacer(),
          buttonRow(),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  Widget onboardLogo() {
    return GlassmorphismCard(
      boxHeight: 295.h,
      isCenter: true,
      childAlignment: Alignment.center,
      child: Image.asset(
        "${Paths.iconPath}onboard_logo.png",
        height: 200.h,
        width: 225.w,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget buttonRow() {
    return PaddedScreen(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            width: 150.w,
            onPressed: () {
              Get.to(
                const RegisterPage(),
              );
            },
            buttonText: "Register",
          ),
          CustomButton(
            width: 150.w,
            onPressed: () {
              Get.to(
                const LoginPage(),
              );
            },
            buttonText: "Sign In",
          ),
        ],
      ),
    );
  }
}
