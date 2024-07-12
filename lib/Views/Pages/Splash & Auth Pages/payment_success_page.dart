import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/auth_top_logo.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: PaddedScreen(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AuthTopLogo(),
              successBox(),
              CustomButton(
                onPressed: () {
                  Get.offAll(
                    const RootScreen(),
                  );
                },
                buttonText: "Return to Home",
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget successBox() {
    return GlassmorphismCard(
      boxHeight: 300.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "${Paths.iconPath}success.png",
            height: 120.h,
            width: 120.w,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 20.h),
          TextStyles.customText(
            title: "Payment Successful",
            fontSize: 20.sp,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
