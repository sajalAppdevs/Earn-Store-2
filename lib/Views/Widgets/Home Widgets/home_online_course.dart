import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_course_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeOnlineCourse extends StatelessWidget {
  const HomeOnlineCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
      child: GlassmorphismCard(
        boxHeight: 160.h,
        verticalPadding: 20.h,
        horizontalPadding: 20.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleText(
              title: "Online Course",
              fontSize: 18.sp,
              onPressed: () {
                Get.to(
                  const AllCoursePage(),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                courseBox(),
                courseBox(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget courseBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "${Paths.iconPath}ten_minutes.png",
          height: 33.h,
          width: 100.w,
        ),
        SizedBox(height: 10.h),
        TextStyles.customText(
          title: "Ten Minute School",
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        )
      ],
    );
  }
}
