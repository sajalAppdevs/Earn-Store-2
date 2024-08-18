import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularCourseInstructor extends StatelessWidget {
  const PopularCourseInstructor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyles.customText(
          title: "Course Instructor",
        ),
        SizedBox(height: 15.h),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return instructorBox(index: index);
          },
        )
      ],
    );
  }

  Widget instructorBox({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Image.asset(
            "${Paths.imagePath}instructor_image.jpg",
            height: 60.h,
            width: 70.w,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyles.customText(
                title: "Most. Rashidatul Kobra",
                fontSize: 14.sp,
              ),
              TextStyles.customText(
                title: "UI/UX Designer, Code Studio",
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          )
        ],
      ),
    );
  }
}
