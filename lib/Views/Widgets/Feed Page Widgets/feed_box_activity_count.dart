import 'package:earn_store/Controllers/Social%20Media%20Controllers/social_media_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FeedBoxActivityCount extends StatelessWidget {
  final int index;
  const FeedBoxActivityCount({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    SocialMediaController controller = Get.put(SocialMediaController());
    return Obx(
      () {
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
                    title: controller
                        .socialMedias.value!.posts![index].likeCount
                        .toString(),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              TextStyles.customText(
                title:
                    "${controller.socialMedias.value!.posts![index].commentCount} comments",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        );
      },
    );
  }
}
