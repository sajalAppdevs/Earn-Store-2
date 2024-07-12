import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Earning%20Page%20Widgets/withdraw_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Withdraw Money"),
          SizedBox(height: 30.h),
          balanceWidget(),
          SizedBox(height: 30.h),
          const WithdrawBody()
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
}
