import 'package:earn_store/Controllers/Social%20Media%20Controllers/social_media_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/url_helpers.dart';
import 'package:earn_store/Views/Pages/Feed%20Pages/all_comment_page.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FeedBoxBottom extends StatelessWidget {
  final int index;
  const FeedBoxBottom({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    SocialMediaController controller = Get.put(SocialMediaController());
    return PaddedScreen(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "${Paths.iconPath}like_icon.png",
                height: 21.h,
                width: 21.w,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 8.w),
              TextStyles.customText(
                title: "Like",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                AllCommentPage(
                  postID: controller.socialMedias.value!.posts![index].id
                      .toString(),
                ),
              );
            },
            child: Row(
              children: [
                Image.asset(
                  "${Paths.iconPath}comment_icon.png",
                  height: 25.h,
                  width: 25.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 8.w),
                TextStyles.customText(
                  title: "Comment",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              await UrlHelpers.shareOnSocialMedia(
                  url: "https://earnstor.lens-ecom.store/?refer=34?id=45");
            },
            child: Row(
              children: [
                Image.asset(
                  "${Paths.iconPath}share.png",
                  height: 25.h,
                  width: 25.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 8.w),
                TextStyles.customText(
                  title: "Share",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
