import 'package:earn_store/Controllers/Home%20Controllers/all_youtube_video_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/youtube_video_details.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllYoutubeVideoBox extends StatelessWidget {
  const AllYoutubeVideoBox({super.key});

  @override
  Widget build(BuildContext context) {
    AllYoutubeVideoController controller = Get.put(AllYoutubeVideoController());
    return Obx(
      () {
        return PaddedScreen(
          child: ListView.builder(
            itemCount: controller.videos.value!.unseenVideos!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return videoBox(index: index);
            },
          ),
        );
      },
    );
  }

  Widget videoBox({required int index}) {
    AllYoutubeVideoController controller = Get.put(AllYoutubeVideoController());
    return Obx(
      () {
        String videoID =
            controller.videos.value!.unseenVideos![index].id.toString();
        String videoUrl =
            controller.videos.value!.unseenVideos![index].videoUrl.toString();
        String point =
            controller.videos.value!.unseenVideos![index].points.toString();
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: GlassmorphismCard(
            onPressed: () {
              Get.to(
                YoutubeVideoDetails(
                  videoUrl: videoUrl,
                  videoID: videoID,
                ),
              );
            },
            boxHeight: 150.h,
            boxTopPadding: 30.h,
            boxBottomPadding: 20.h,
            boxLeftPadding: 20.w,
            boxRightPadding: 20.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "${Paths.iconPath}play.png",
                  height: 40.h,
                  width: 40.w,
                  fit: BoxFit.fill,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextStyles.customText(
                      title: "Play Video",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    TextStyles.customText(
                      title: "Total Point: $point",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
