import 'package:earn_store/Utils/url_helpers.dart';
import 'package:earn_store/Views/Common%20Widgets/auth_top_logo.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/payment_success_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PackagePage extends StatelessWidget {
  const PackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: PaddedScreen(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 40.h),
            const AuthTopLogo(),
            SizedBox(height: 10.h),
            TextStyles.customText(
              title: "Packages",
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 30.h),
            packageBox(
              title: "Basic",
              price: "Free",
              onPressed: () {
                Get.offAll(
                  const RootScreen(),
                );
              },
            ),
            SizedBox(height: 30.h),
            packageBox(
              title: "Premium",
              price: "\$ 200",
              onPressed: () async {
                await UrlHelpers.openUrl(
                    "https://shop.bkash.com/an-telecom01919914978/pay/bdt5/BfP3Mx");
                Get.to(
                  const PaymentSuccessPage(),
                );
              },
            ),
            SizedBox(height: 30.h),
            packageBox(
              title: "Branch",
              price: "\$ 300",
              onPressed: () async {
                await UrlHelpers.openUrl(
                    "https://shop.bkash.com/an-telecom01919914978/pay/bdt10/xM7O1e");
                Get.to(
                  const PaymentSuccessPage(),
                );
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget packageBox({
    required String title,
    required String price,
    required VoidCallback onPressed,
  }) {
    return GlassmorphismCard(
      boxHeight: 260.h,
      verticalPadding: 15.h,
      horizontalPadding: 20.w,
      child: Column(
        children: [
          TextStyles.customText(
            title: title,
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
          buttonRow(price: price, onPressed: onPressed),
        ],
      ),
    );
  }

  Widget buttonRow({
    required String price,
    required VoidCallback onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          width: 130.w,
          onPressed: () {},
          buttonText: price,
        ),
        CustomButton(
          width: 130.w,
          onPressed: onPressed,
          buttonText: "Select",
        ),
      ],
    );
  }
}
