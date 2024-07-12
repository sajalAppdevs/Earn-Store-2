import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpinPage extends StatelessWidget {
  const SpinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Spin"),
          PaddedScreen(
            padding: 15.w,
            child: Column(
              children: [
                SizedBox(height: 100.h),
                spinImage(),
                CustomButton(
                  width: 150.w,
                  onPressed: () {},
                  buttonText: "Run Spin",
                  textSize: 16.sp,
                ),
                SizedBox(height: 30.h),
                customText(
                  title:
                      "Your refer num is 102. You can run this Spin when it will be 105.",
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget spinImage() {
    return Image.asset(
      "${Paths.iconPath}spin_big.png",
      height: 157.h,
      width: 157.w,
      fit: BoxFit.fill,
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      isShowAll: true,
    );
  }
}
