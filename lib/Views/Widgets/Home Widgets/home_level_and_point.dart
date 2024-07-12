import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeLevelAndPoint extends StatelessWidget {
  const HomeLevelAndPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          infoBox(title: "Level", info: "04"),
          infoBox(title: "Points", info: "45635"),
        ],
      ),
    );
  }

  Widget infoBox({required String title, required String info}) {
    return GlassmorphismCard(
      boxHeight: 85.h,
      boxWidth: 155.w,
      verticalPadding: 10.h,
      horizontalPadding: 10.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextStyles.customText(
              title: title,
              fontWeight: FontWeight.w400,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextStyles.customText(
              fontSize: 20.sp,
              title: info,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
