import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedBoxActivityCount extends StatelessWidget {
  const FeedBoxActivityCount({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "${Paths.iconPath}like.png",
                height: 20.h,
                width: 20.w,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 8.w),
              TextStyles.customText(
                title: "100",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
          TextStyles.customText(
            title: "38 comments",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
