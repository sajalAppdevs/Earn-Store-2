import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/User%20Controllers/leaderboard_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/leaderboard_top_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LeaderboardBody extends StatelessWidget {
  const LeaderboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    LeaderboardController controller = Get.put(LeaderboardController());
    return Obx(
      () {
        return ListView.builder(
          itemCount: controller.leaderboard.value!.leaderBoard!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return index > 2
                ? generalBox(index: index)
                : LeaderboardTopBox(index: index);
          },
        );
      },
    );
  }

  Widget generalBox({required int index}) {
    LeaderboardController controller = Get.put(LeaderboardController());
    int rank = index + 1;
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: GlassmorphismCard(
            boxHeight: 50.h,
            horizontalPadding: 15.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  title: rank.toString(),
                ),
                nameAndImage(index: index),
                customText(
                  title: controller
                      .leaderboard.value!.leaderBoard![index].refers
                      .toString(),
                ),
                customText(
                  title: controller.leaderboard.value!.leaderBoard![index].point
                      .toString(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget nameAndImage({required int index}) {
    LeaderboardController controller = Get.put(LeaderboardController());
    return Obx(
      () {
        return Row(
          children: [
            CachedNetworkImage(
              imageUrl: controller
                  .leaderboard.value!.leaderBoard![index].imageUrl
                  .toString(),
              imageBuilder: (context, imageProvider) => Container(
                height: 25.h,
                width: 25.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => ButtonLoading(loadingSize: 12.sp),
              errorWidget: (context, url, error) => Container(
                height: 25.h,
                width: 25.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      "${Paths.imagePath}blank_image.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 2.w),
            SizedBox(
              width: 120.w,
              child: TextStyles.customText(
                title: controller.leaderboard.value!.leaderBoard![index].name
                    .toString(),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.left,
              ),
            )
          ],
        );
      },
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    );
  }
}
