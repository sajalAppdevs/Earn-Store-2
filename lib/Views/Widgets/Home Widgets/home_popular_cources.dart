import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePopularCources extends StatelessWidget {
  const HomePopularCources({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Column(
        children: [
          const TitleText(title: "Popular Courses"),
          SizedBox(height: 10.h),
          cources(),
        ],
      ),
    );
  }

  Widget cources() {
    return Column(
      children: List.generate(
        3,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: 15.w),
          child: GlassmorphismCard(
            boxHeight: 100.h,
            horizontalPadding: 10.w,
            verticalPadding: 10.h,
            child: Row(
              children: [
                Image.asset(
                  "${Paths.iconPath}cource.png",
                  height: 75.h,
                  width: 130.w,
                ),
                SizedBox(width: 5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextStyles.customText(
                      title: "IELTS Batch",
                      fontSize: 15.sp,
                    ),
                    SizedBox(height: 5.h),
                    TextStyles.customText(
                      title: "Hasnain Nur Sezan  +4",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 5.h),
                    TextStyles.customText(
                      title: "For Class VI    Free",
                      fontSize: 13.sp,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
