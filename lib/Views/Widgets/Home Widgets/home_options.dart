import 'package:earn_store/Utils/dummy_data.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_watch_video_page.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_youtube_video_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeOptions extends StatelessWidget {
  const HomeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 15.w,
          childAspectRatio: 1 / 0.9,
        ),
        itemCount: DummyData.homeOptions.length,
        itemBuilder: (BuildContext context, int index) {
          return GlassmorphismCard(
            verticalPadding: 20.h,
            onPressed: () {
              if (index == 0) {
                Get.to(
                  const AllWatchVideoPage(),
                );
              } else if (index == 1) {
                Get.to(
                  const AllYoutubeVideoPage(),
                );
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  DummyData.homeOptions[index].imagePath,
                  height: DummyData.homeOptions[index].height,
                  width: DummyData.homeOptions[index].width,
                  fit: BoxFit.fill,
                ),
                TextStyles.customText(
                  title: DummyData.homeOptions[index].name,
                  fontSize: 15.sp,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
