import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularContentPreview extends StatelessWidget {
  const PopularContentPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyles.customText(
          title: "Content Preview",
          fontSize: 14.sp,
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
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Image.asset(
            "${Paths.iconPath}video.png",
            height: 20.h,
            width: 20.w,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 10.w),
          SizedBox(
            width: 300.w,
            child: TextStyles.customText(
              title: "Video: IELTS: Introduction",
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
