import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/payment_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpdatePackagePage extends StatelessWidget {
  const UpdatePackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: PaddedScreen(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 40.h),
            TextStyles.customText(
              title: "Packages",
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 30.h),
            packageBox(),
            packageBox(),
            packageBox(),
          ],
        ),
      ),
    );
  }

  Widget packageBox() {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: GlassmorphismCard(
        boxHeight: 260.h,
        verticalPadding: 15.h,
        horizontalPadding: 20.w,
        child: Column(
          children: [
            TextStyles.customText(
              title: "Basic",
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
