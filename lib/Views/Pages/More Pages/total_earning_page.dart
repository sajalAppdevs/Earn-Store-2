import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/total_earning_recent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalEarningPage extends StatelessWidget {
  const TotalEarningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(
            title: "Total Earning",
          ),
          SizedBox(height: 20.h),
          totalEarningTopBox(),
          SizedBox(height: 20.h),
          const TotalEarningRecent()
        ],
      ),
    );
  }

  Widget totalEarningTopBox() {
    return PaddedScreen(
      child: GlassmorphismCard(
        boxHeight: 100.h,
        verticalPadding: 15.h,
        horizontalPadding: 20.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextStyles.customText(
              title: "Today",
              fontSize: 20.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextStyles.customText(
                  title: "Total Income",
                  fontWeight: FontWeight.w500,
                ),
                TextStyles.customText(
                  title: "305 Bdt",
                  fontSize: 24.sp,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
