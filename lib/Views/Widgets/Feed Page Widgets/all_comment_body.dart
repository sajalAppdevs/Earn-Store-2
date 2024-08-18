import 'dart:ui';

import 'package:earn_store/Controllers/Social%20Media%20Controllers/post_comment_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllCommentBody extends StatelessWidget {
  const AllCommentBody({super.key});

  @override
  Widget build(BuildContext context) {
    PostCommentController controller = Get.put(PostCommentController());
    return Obx(
      () {
        return Expanded(
          child: ListView.builder(
            itemCount: controller.comments.value!.comments!.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userImage(),
                    SizedBox(width: 10.w),
                    customGlass(index: index),
                  ],
                ),
              );
            },
          ),
        );
      },
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

  Widget customGlass({required int index}) {
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
                  boxName(index: index),
                  SizedBox(height: 8.h),
                  boxComment(index: index),
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

  Widget boxName({required int index}) {
    PostCommentController controller = Get.put(PostCommentController());
    return Obx(
      () {
        return TextStyles.customText(
          title: controller.comments.value!.comments![index].name.toString(),
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        );
      },
    );
  }

  Widget boxComment({required int index}) {
    PostCommentController controller = Get.put(PostCommentController());
    return Obx(
      () {
        return TextStyles.customText(
          title: controller.comments.value!.comments![index].text.toString(),
          isShowAll: true,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.left,
        );
      },
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
