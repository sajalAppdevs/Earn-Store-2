import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Social%20Media%20Controllers/social_media_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Pages/Feed%20Pages/feed_video_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FeedBoxContent extends StatelessWidget {
  final int index;
  const FeedBoxContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    SocialMediaController controller = Get.put(SocialMediaController());

    return Obx(
      () {
        String? imagePath = controller.socialMedias.value!.posts![index].image;
        String? videoPath = controller.socialMedias.value!.posts![index].video;
        return imagePath != null
            ? imageWidget(imagePath: imagePath)
            : videoWidget(
                videoPath: videoPath.toString(),
              );
      },
    );
  }

  Widget imageWidget({required String imagePath}) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder: (context, imageProvider) => Container(
        height: 300.h,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => const ButtonLoading(),
      errorWidget: (context, url, error) => Container(
        height: 300.h,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
    );
  }

  Widget videoWidget({required String videoPath}) {
    return GestureDetector(
      onTap: () {
        Get.to(
          FeedVideoDetails(videoUrl: videoPath),
        );
      },
      child: Container(
        height: 300.h,
        width: Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          image: const DecorationImage(
            image: AssetImage(
              "${Paths.imagePath}feed.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Image.asset(
          "${Paths.iconPath}play.png",
          height: 70.h,
          width: 70.w,
        ),
      ),
    );
  }
}
