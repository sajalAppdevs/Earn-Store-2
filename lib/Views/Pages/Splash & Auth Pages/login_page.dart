import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Common%20Widgets/auth_top_logo.dart';
import 'package:earn_store/Views/Common%20Widgets/non_glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 40.h),
          const AuthTopLogo(),
          SizedBox(height: 10.h),
          TextStyles.customText(
            title: "LOGIN",
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 40.h),
          loginBox(),
          SizedBox(height: 100.h),
          signUpText(),
        ],
      ),
    );
  }

  Widget loginBox() {
    return NonGlassMorphismCard(
      boxHeight: 320.h,
      borderColor: TextColors.textColor1,
      horizontalPadding: 20.w,
      isCenter: true,
      child: Column(
        children: [
          SizedBox(height: 30.h),
          CustomField(
            hintText: "Email",
            controller: TextEditingController(),
          ),
          SizedBox(height: 20.h),
          CustomField(
            isPassword: true,
            hintText: "Password",
            controller: TextEditingController(),
          ),
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.centerRight,
            child: TextStyles.customText(
              title: "Forgot password?",
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 30.h),
          CustomButton(
            onPressed: () {
              Get.offAll(
                const RootScreen(),
              );
            },
            buttonText: "Log In",
          )
        ],
      ),
    );
  }

  Widget signUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextStyles.customText(
          title: "Don’t have an account? ",
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),
        TextStyles.customText(
          title: "Sign UP",
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: TextColors.textColor2,
        ),
      ],
    );
  }
}
