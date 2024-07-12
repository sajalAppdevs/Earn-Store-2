import 'package:carousel_slider/carousel_slider.dart';
import 'package:earn_store/Controllers/Home%20Controllers/home_advertise_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeAdvertisement extends StatelessWidget {
  const HomeAdvertisement({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeAdvertiseController controller = Get.put(
      HomeAdvertiseController(),
    );
    return Obx(
      () {
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: controller.sliderLength.value,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(
                    image: AssetImage(
                      "${Paths.imagePath}home_banner.jpg",
                    ),
                  ),
                ),
              ),
              options: CarouselOptions(
                height: 150.h,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  controller.setSliderIndex(value: index);
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            indexIndicator(),
          ],
        );
      },
    );
  }

  Widget indexIndicator() {
    final HomeAdvertiseController controller = Get.put(
      HomeAdvertiseController(),
    );
    return Obx(
      () {
        int currentIndex = controller.sliderIndex.value;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            controller.sliderLength.value,
            (index) {
              return currentIndex == index
                  ? Container(
                      height: 8.h,
                      width: 8.w,
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: GeneralColors.indicatorColor,
                        border: Border.all(
                          color: TextColors.textColor1,
                          width: 1.w,
                        ),
                      ),
                    )
                  : Container(
                      height: 8.h,
                      width: 8.w,
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: GeneralColors.indicatorColor,
                          width: 1.w,
                        ),
                      ),
                    );
            },
          ),
        );
      },
    );
  }
}
