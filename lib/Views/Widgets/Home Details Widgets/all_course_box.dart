import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_course_details.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllCourseBox extends StatelessWidget {
  const AllCourseBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return courseBox(index: index);
      },
    );
  }

  Widget courseBox({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: GlassmorphismCard(
        boxHeight: 130.h,
        onPressed: () {
          Get.to(
            const AllCourseDetails(),
          );
        },
        childAlignment: Alignment.centerLeft,
        boxLeftPadding: 20.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "${Paths.iconPath}ten_minutes.png",
              height: 40.h,
              width: 150.w,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10.h),
            TextStyles.customText(
              title: "Ten Minute School",
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }
}
