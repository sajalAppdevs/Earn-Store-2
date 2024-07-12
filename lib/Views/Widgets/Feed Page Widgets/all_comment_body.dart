import 'dart:ui';

import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCommentBody extends StatelessWidget {
  const AllCommentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userImage(),
                SizedBox(width: 10.w),
                customGlass(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget userImage() {
    return Container(
      height: 37.h,
      width: 37.w,
      margin: EdgeInsets.only(top: 5.h),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            "${Paths.imagePath}blank_image.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget customGlass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              constraints: BoxConstraints(minWidth: 200.w, maxWidth: 270.w),
              padding: EdgeInsets.only(
                top: 15.h,
                bottom: 25.h,
                left: 15.w,
                right: 15.w,
              ),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: GlassMorphismColors.glassColor1,
                boxShadow: [
                  BoxShadow(
                    color: GeneralColors.shadowColor1.withOpacity(0.26),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(1.18, 1.18),
                  ),
                  BoxShadow(
                    color: GeneralColors.blackColor.withOpacity(0.30),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(-1.18, -1.18),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boxTop(),
                  SizedBox(height: 5.h),
                  boxName(),
                  SizedBox(height: 8.h),
                  boxComment(),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        actions()
      ],
    );
  }

  Widget boxTop() {
    return Row(
      children: [
        Image.asset(
          "${Paths.iconPath}diamond.png",
          height: 11.h,
          width: 13.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 5.w),
        TextStyles.customText(
          title: "Top fan",
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }

  Widget boxName() {
    return TextStyles.customText(
      title: "Rashidatul Kobra",
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
    );
  }

  Widget boxComment() {
    return TextStyles.customText(
      title: "Wow nice ",
      isShowAll: true,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      textAlign: TextAlign.left,
    );
  }

  Widget actions() {
    return Row(
      children: [
        SizedBox(width: 20.w),
        TextStyles.customText(
          title: "1 hour",
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(width: 30.w),
        TextStyles.customText(
          title: "Like",
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(width: 30.w),
        TextStyles.customText(
          title: "Reply",
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
