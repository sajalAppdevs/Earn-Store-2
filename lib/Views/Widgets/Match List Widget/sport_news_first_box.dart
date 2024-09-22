import 'package:earn_store/Controllers/Home%20Controllers/sport_news_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SportNewsFirstBox extends StatelessWidget {
  final int index;
  const SportNewsFirstBox({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: GlassmorphismCard(
        boxHeight: 285.h,
        verticalPadding: 15.h,
        horizontalPadding: 15.w,
        child: Column(
          children: [
            newsImage(),
            SizedBox(height: 5.h),
            newsTitle(),
            const Spacer(),
            newsTime(),
          ],
        ),
      ),
    );
  }

  Widget newsImage() {
    SportNewsController controller = Get.put(
      SportNewsController(),
    );
    return Obx(
      () {
        return NetworkImageWidget(
          imageUrl: controller.newsUpdates.value!.news![index].image.toString(),
          height: 160.h,
          width: 290.w,
          verticalPaddingForLoading: 50.h,
        );
      },
    );
  }

  Widget newsTitle() {
    SportNewsController controller = Get.put(
      SportNewsController(),
    );
    return Obx(
      () {
        return SizedBox(
          height: 60.h,
          width: 290.w,
          child: TextStyles.customText(
            title: controller.newsUpdates.value!.news![index].description
                .toString(),
            fontSize: 14.sp,
            isShowAll: true,
            textAlign: TextAlign.left,
          ),
        );
      },
    );
  }

  Widget newsTime() {
    SportNewsController controller = Get.put(
      SportNewsController(),
    );
    return Obx(
      () {
        return SizedBox(
          width: 290.w,
          child: TextStyles.customText(
            title:
                controller.newsUpdates.value!.news![index].createdAt.toString(),
            fontSize: 12.sp,
            isShowAll: true,
            textAlign: TextAlign.right,
          ),
        );
      },
    );
  }
}
