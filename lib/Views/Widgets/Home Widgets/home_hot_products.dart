import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHotProducts extends StatelessWidget {
  const HomeHotProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        const TitleText2(
          title: "Hot Products",
        ),
        SizedBox(
          height: 20.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              4,
              (index) => productBox(index: index),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  Widget productBox({required int index}) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: GlassmorphismCard(
        boxHeight: 170.h,
        boxWidth: 150.w,
        verticalPadding: 10.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "${Paths.iconPath}oil.png",
              height: 85.h,
              width: 135.w,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 5.h),
            customText(
              title: "Soybean Oil",
            ),
            customText(
              title: "Varient",
            )
          ],
        ),
      ),
    );
  }

  Widget customText({required String title}) {
    return SizedBox(
      width: 130.w,
      child: TextStyles.customText(
        title: title,
        fontSize: 13.sp,
        isShowAll: true,
      ),
    );
  }
}
