import 'package:earn_store/Controllers/Home%20Controllers/sport_news_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SportNewsBox extends StatelessWidget {
  final int index;
  const SportNewsBox({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: GlassmorphismCard(
        boxHeight: 105.h,
        verticalPadding: 15.h,
        horizontalPadding: 15.w,
        child: Row(
          children: [
            newsImage(),
            SizedBox(width: 10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                newsTitle(),
                const Spacer(),
                newsTime(),
              ],
            ),
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
          height: 80.h,
          width: 100.w,
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
          height: 50.h,
          width: 175.w,
          child: TextStyles.customText(
            title: controller.newsUpdates.value!.news![index].description
                .toString(),
            fontSize: 11.sp,
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
          width: 175.w,
          child: TextStyles.customText(
            title:
                controller.newsUpdates.value!.news![index].createdAt.toString(),
            fontSize: 9.sp,
            isShowAll: true,
            textAlign: TextAlign.left,
          ),
        );
      },
    );
  }
}
