import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/payment_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WatchVideoPackagePage extends StatelessWidget {
  const WatchVideoPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Watch Video Package"),
          SizedBox(height: 30.h),
          packageBox(),
          packageBox(),
          packageBox(),
        ],
      ),
    );
  }

  Widget packageBox() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 30.h,
        left: 20.w,
        right: 20.w,
      ),
      child: GlassmorphismCard(
        boxHeight: 260.h,
        verticalPadding: 15.h,
        horizontalPadding: 20.w,
        child: Column(
          children: [
            TextStyles.customText(
              title: "10 Minute",
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 20.h),
            TextStyles.customText(
              title: '''In this plan you will only buy
      you can not earn. This is free basic Plan for you.''',
              fontSize: 18.sp,
              isShowAll: true,
              fontWeight: FontWeight.w400,
            ),
            const Spacer(),
            buttonRow(),
          ],
        ),
      ),
    );
  }

  Widget buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          width: 130.w,
          onPressed: () {
            Get.to(
              const PaymentPage(),
            );
          },
          buttonText: "Free",
        ),
        CustomButton(
          width: 130.w,
          onPressed: () {
            Get.to(
              const PaymentPage(),
            );
          },
          buttonText: "Select",
        ),
      ],
    );
  }
}
