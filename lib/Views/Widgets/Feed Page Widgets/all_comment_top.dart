import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCommentTop extends StatelessWidget {
  const AllCommentTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            likeWidget(),
            likeIcon(),
          ],
        ),
        SizedBox(height: 8.h),
        allCommentText(),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget likeWidget() {
    return Row(
      children: [
        Image.asset(
          "${Paths.iconPath}like.png",
          height: 20.h,
          width: 20.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 10.w),
        TextStyles.customText(
          title: "100",
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(width: 10.w),
        Icon(
          Icons.arrow_forward_ios,
          size: 15.sp,
          color: TextColors.textColor1,
        )
      ],
    );
  }

  Widget likeIcon() {
    return IconButton(
      onPressed: () {},
      icon: ImageIcon(
        const AssetImage(
          "${Paths.iconPath}like_icon.png",
        ),
        color: TextColors.textColor1,
        size: 21.sp,
      ),
    );
  }

  Widget allCommentText() {
    return Row(
      children: [
        TextStyles.customText(
          title: "All comments",
        ),
        SizedBox(width: 5.w),
        Icon(
          Icons.keyboard_arrow_down,
          size: 25.sp,
          color: TextColors.textColor1,
        )
      ],
    );
  }
}
