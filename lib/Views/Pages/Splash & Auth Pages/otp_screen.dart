import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/auth_top_logo.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/package_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Splash%20&%20Auth%20Widgets/otp_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: PaddedScreen(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const AuthTopLogo(),
              SizedBox(height: 50.h),
              messegeWidget(),
              const OTPField(),
              SizedBox(height: 230.h),
              CustomButton(
                onPressed: () {
                  Get.offAll(
                    const PackagePage(),
                  );
                },
                buttonText: "Verify",
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget messegeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "${Paths.iconPath}otp.png",
          height: 50.h,
          width: 50.w,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 30.h),
        TextStyles.customText(
          title: "Verification Code",
          fontSize: 20.sp,
        ),
        SizedBox(height: 15.h),
        TextStyles.customText(
          title:
              "We have to sent the code verification to\nEnter the OTP sent to +88018******66",
          fontWeight: FontWeight.w500,
          fontSize: 13.sp,
          isShowAll: true,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
