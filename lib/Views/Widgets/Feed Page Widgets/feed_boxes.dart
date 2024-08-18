import 'package:earn_store/Controllers/Social%20Media%20Controllers/social_media_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/feed_box_activity_count.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/feed_box_bottom.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/feed_box_content.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/feed_box_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FeedBoxes extends StatelessWidget {
  const FeedBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    SocialMediaController controller = Get.put(SocialMediaController());
    return Obx(
      () {
        return ListView.builder(
          itemCount: controller.socialMedias.value!.posts!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return controller.socialMedias.value!.posts![index].image == null &&
                    controller.socialMedias.value!.posts![index].video == null
                ? Container()
                : feedBox(index: index);
          },
        );
      },
    );
  }

  Widget feedBox({required int index}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.4),
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
        children: [
          const FeedBoxTop(),
          SizedBox(height: 15.h),
          FeedBoxContent(
            index: index,
          ),
          SizedBox(height: 15.h),
          FeedBoxActivityCount(
            index: index,
          ),
          SizedBox(height: 10.h),
          Divider(
            color: TextColors.textColor1,
            height: 1.h,
            thickness: 0.4,
          ),
          SizedBox(height: 15.h),
          FeedBoxBottom(
            index: index,
          )
        ],
      ),
    );
  }
}
