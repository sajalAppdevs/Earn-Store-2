import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularCourseContentDetails extends StatelessWidget {
  const PopularCourseContentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyles.customText(
          title: "Course Details",
        ),
        SizedBox(height: 15.h),
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return contentBox(index: index);
          },
        )
      ],
    );
  }

  Widget contentBox({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Container(
            height: 10.h,
            width: 10.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: TextColors.textColor1,
            ),
          ),
          SizedBox(width: 8.w),
          SizedBox(
            width: 300.w,
            child: TextStyles.customText(
              title: "Those who aim to go abroad for work or higher education",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              isShowAll: true,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
