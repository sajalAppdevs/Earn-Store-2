import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RechargePage extends StatelessWidget {
  const RechargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Recharge Money"),
          SizedBox(height: 30.h),
          balanceWidget(),
          SizedBox(height: 40.h),
          PaddedScreen(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText(title: "Enter Account Number"),
                CustomField(
                  hintText: "",
                  controller: TextEditingController(),
                ),
                SizedBox(height: 30.h),
                titleText(title: "Enter Amount"),
                CustomField(
                  hintText: "",
                  controller: TextEditingController(),
                ),
                SizedBox(height: 200.h),
                CustomButton(
                  onPressed: () {},
                  buttonText: "Proceed",
                ),
                SizedBox(height: 70.h),
              ],
            ),
          )
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

  Widget titleText({required String title}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 5.w),
      child: TextStyles.customText(
        title: title,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
