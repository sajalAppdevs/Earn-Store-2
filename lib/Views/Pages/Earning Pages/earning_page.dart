import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Earning%20Pages/recharge_page.dart';
import 'package:earn_store/Views/Pages/Earning%20Pages/withdraw_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EarningPage extends StatelessWidget {
  const EarningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: Column(
        children: [
          const CustomTop(title: "Earning"),
          SizedBox(height: 30.h),
          balanceWidget(),
          const Spacer(),
          buttonRow(),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }

  Widget balanceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextStyles.customText(
          title: "Your account balance is: 2871 X 0.5",
          fontSize: 14.sp,
        ),
        SizedBox(height: 10.h),
        TextStyles.customText(
          title: "1435 BDT",
          fontSize: 22.sp,
        )
      ],
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
                const WithdrawPage(),
              );
            },
            buttonText: "Withdraw",
          ),
          CustomButton(
            width: 150.w,
            onPressed: () {
              Get.to(
                const RechargePage(),
              );
            },
            buttonText: "Recharge",
          ),
        ],
      ),
    );
  }
}
