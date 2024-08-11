import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/dummy_data.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_watch_video_page.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_youtube_video_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeOptions extends StatelessWidget {
  const HomeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        children: [
          TitleText(
            title: "Free Earn",
            onPressed: () {},
          ),
          SizedBox(height: 15.h),
          ListView.builder(
            itemCount: DummyData.homeOptions.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: GlassmorphismCard(
                  boxHeight: 65.h,
                  horizontalPadding: 20.w,
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
                  child: Row(
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
                        fontSize: 17.sp,
                      ),
                      Image.asset(
                        "${Paths.iconPath}arrow_right_box.png",
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
