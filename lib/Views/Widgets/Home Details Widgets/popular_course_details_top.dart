import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularCourseDetailsTop extends StatelessWidget {
  const PopularCourseDetailsTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        courseVideoImage(),
        SizedBox(height: 15.h),
        priceAndEnrollButton(),
        nameAndDescription(),
        SizedBox(height: 15.h),
        courseProperties(),
      ],
    );
  }

  Widget courseVideoImage() {
    return Container(
      height: 160.h,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        image: const DecorationImage(
          image: AssetImage(
            "${Paths.imagePath}course.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget priceAndEnrollButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            TextStyles.customText(
              title: "৳5500",
              fontSize: 18.sp,
            ),
            SizedBox(width: 5.w),
            TextStyles.customText(
              title: "৳7000",
              fontSize: 14.sp,
              discountText: true,
            ),
          ],
        ),
        CustomButton(
          height: 35.h,
          width: 100.w,
          onPressed: () {},
          buttonText: "Enroll",
        )
      ],
    );
  }

  Widget nameAndDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h),
        TextStyles.customText(
          title: "IELTS Batch",
        ),
        SizedBox(height: 15.h),
        TextStyles.customText(
          title:
              "If your goal is to study or work abroad, achieving a competitive band score on the IELTS exam is essential. That's why 10 Minute School is proud to introduce the 'IELTS Live Batch' Live Course. Designed for learners aiming to excel on the exam and pursue opportunities abroad, this course offers in-depth instruction on all four skills: Listening, Reading, Writing, and Speaking. With 36 interactive live classes led by experienced instructors, you'll receive expert guidance over 12 weeks. Don't wait any longer – enroll now to reach your desired IELTS band score.",
          fontSize: 14.sp,
          isShowAll: true,
          textAlign: TextAlign.left,
        )
      ],
    );
  }

  Widget courseProperties() {
    return Column(
      children: [
        propertiesBox(
          iconPath: "enroll.png",
          title: "525 Enroll Course",
        ),
        propertiesBox(
          iconPath: "duration.png",
          title: "Course duration: 3 month",
        ),
        propertiesBox(
          iconPath: "course_clock.png",
          title: "Time 20 Hour",
        ),
        propertiesBox(
          iconPath: "course_video.png",
          title: "24 Video Lecture",
        ),
        propertiesBox(
          iconPath: "pdf.png",
          title: "23 Class Lecture PDF",
        ),
      ],
    );
  }

  Widget propertiesBox({
    required String iconPath,
    required String title,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Paths.iconPath + iconPath,
            height: 20.h,
            width: 20.w,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 7.w),
          TextStyles.customText(
            title: title,
            fontSize: 14.sp,
          )
        ],
      ),
    );
  }
}
