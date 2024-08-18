import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/User%20Controllers/leaderboard_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LeaderboardTopBox extends StatelessWidget {
  final int index;
  const LeaderboardTopBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: topBox(index: index),
    );
  }

  Widget topBox({required int index}) {
    LeaderboardController controller = Get.put(LeaderboardController());
    int king = index + 1;
    Alignment alignment = Alignment.centerLeft;
    if (index == 1) {
      alignment = Alignment.centerRight;
    }
    return Obx(
      () {
        return Align(
          alignment: alignment,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              GlassmorphismCard(
                boxHeight: 65.h,
                boxWidth: 260.w,
                borderRadius: 45.r,
                horizontalPadding: 15.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      title: king.toString(),
                    ),
                    nameAndImage(index: index),
                    customText(
                      title: controller
                          .leaderboard.value!.leaderBoard![index].refers
                          .toString(),
                    ),
                    customText(
                      title: controller
                          .leaderboard.value!.leaderBoard![index].point
                          .toString(),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: index == 1 ? 5 : 225.w,
                top: -8.h,
                child: Image.asset(
                  "${Paths.iconPath}king$king.png",
                  height: 30.h,
                  width: 30.w,
                  fit: BoxFit.fill,
                ),
              )
            ],
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
                height: 17.h,
                width: 17.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => ButtonLoading(loadingSize: 10.sp),
              errorWidget: (context, url, error) => Container(
                height: 17.h,
                width: 17.w,
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
              width: 110.w,
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
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );
  }
}
