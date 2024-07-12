import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalEarningRecent extends StatelessWidget {
  const TotalEarningRecent({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      padding: 15.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextStyles.customText(
            title: "Recent Earnings",
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            itemCount: 15,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: earningBox(index: index),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget earningBox({required int index}) {
    return GlassmorphismCard(
      boxHeight: 55.h,
      horizontalPadding: 15.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customText(
            title: "2024-05-13 07:13:22",
          ),
          customText(
            title: "RECEIVED",
          ),
          customText(
            title: "105 Bdt",
          ),
        ],
      ),
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
    );
  }
}
