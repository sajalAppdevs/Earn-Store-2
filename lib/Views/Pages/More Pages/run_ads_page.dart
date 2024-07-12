import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/More%20Pages/watch_video_package.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RunAdsPage extends StatelessWidget {
  const RunAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: PaddedScreen(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 40.h),
            TextStyles.customText(
              title: "Packages",
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 30.h),
            packageBox(
              imagePath: "video.png",
              title: "Watch Video",
              onPressed: () {
                Get.to(
                  const WatchVideoPackagePage(),
                );
              },
            ),
            packageBox(
              imagePath: "youtube.png",
              title: "Youtube Video",
            ),
            packageBox(
              imagePath: "yt_subscribe.png",
              title: "YT Subscribe",
            ),
            packageBox(
              imagePath: "play_store.png",
              title: "App Download",
            ),
          ],
        ),
      ),
    );
  }

  Widget packageBox({
    required String imagePath,
    required String title,
    VoidCallback? onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: GlassmorphismCard(
        boxHeight: 130.h,
        verticalPadding: 20.h,
        onPressed: onPressed ?? () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              Paths.iconPath + imagePath,
              height: imagePath == "yt_subscribe.png" ? 54.h : 42.h,
              width: imagePath == "yt_subscribe.png" ? 54.h : 42.w,
            ),
            TextStyles.customText(
              title: title,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
