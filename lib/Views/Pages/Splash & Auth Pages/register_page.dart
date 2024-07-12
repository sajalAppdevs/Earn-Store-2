import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Common%20Widgets/auth_top_logo.dart';
import 'package:earn_store/Views/Common%20Widgets/non_glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/package_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
            title: "REGISTER",
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 40.h),
          registerBoxBox(),
          SizedBox(height: 50.h),
          loginText(),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  Widget registerBoxBox() {
    return NonGlassMorphismCard(
      boxHeight: 590.h,
      borderColor: TextColors.textColor1,
      horizontalPadding: 20.w,
      isCenter: true,
      child: Column(
        children: [
          SizedBox(height: 30.h),
          CustomField(
            hintText: "Name",
            controller: TextEditingController(),
          ),
          SizedBox(height: 20.h),
          CustomField(
            hintText: "Email",
            controller: TextEditingController(),
          ),
          SizedBox(height: 20.h),
          CustomField(
            hintText: "Phone Number",
            controller: TextEditingController(),
          ),
          SizedBox(height: 20.h),
          CustomField(
            hintText: "Refer",
            controller: TextEditingController(),
          ),
          SizedBox(height: 20.h),
          CustomField(
            hintText: "Country",
            controller: TextEditingController(),
          ),
          SizedBox(height: 20.h),
          CustomField(
            hintText: "Password",
            controller: TextEditingController(),
            isPassword: true,
          ),
          SizedBox(height: 20.h),
          CustomField(
            hintText: "Confirm Password",
            controller: TextEditingController(),
            isPassword: true,
          ),
          SizedBox(height: 30.h),
          CustomButton(
            onPressed: () {
              Get.to(const PackagePage());
            },
            buttonText: "Sign Up",
          )
        ],
      ),
    );
  }

  Widget loginText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextStyles.customText(
          title: "Already have an account? ",
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),
        TextStyles.customText(
          title: "Log in",
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: TextColors.textColor2,
        ),
      ],
    );
  }
}
