import 'dart:ui';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 20.h,
          ),
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
              TextStyles.customText(
                title: "Details",
                fontSize: 18.sp,
              ),
              SizedBox(height: 20.h),
              infoRow(
                imagePath: "work.png",
                height: 30.h,
                width: 30.w,
                text:
                    "Ui/UX Designer at Code Studio, Software Company, Rajshahi",
              ),
              SizedBox(height: 15.h),
              infoRow(
                imagePath: "education.png",
                height: 23.h,
                width: 32.w,
                text:
                    "Studied at Information and Communication Engineering at Pabna University of Science and Technology",
              ),
              SizedBox(height: 15.h),
              infoRow(
                imagePath: "house.png",
                height: 27.h,
                width: 30.w,
                text: "Lives in Shibganj, Rajshahi, Bangladesh",
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: infoRow(
                  imagePath: "location.png",
                  height: 20.h,
                  width: 18.w,
                  text: "Shibganj, Rajshahi, Bangladesh",
                ),
              ),
              SizedBox(height: 15.h),
              infoRow(
                imagePath: "heart_full.png",
                height: 24.h,
                width: 28.w,
                text: "Single",
              ),
              SizedBox(height: 15.h),
              infoRow(
                imagePath: "clock.png",
                height: 24.h,
                width: 28.w,
                text: "Joined June 2024",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoRow({
    required String imagePath,
    required double height,
    required double width,
    required String text,
  }) {
    return Row(
      children: [
        Image.asset(
          Paths.iconPath + imagePath,
          height: height,
          width: width,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 10.w),
        SizedBox(
          width: 240.w,
          child: TextStyles.customText(
            title: text,
            fontSize: 14.sp,
            textAlign: TextAlign.left,
            isShowAll: true,
          ),
        )
      ],
    );
  }
}
