import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:earn_store/Controllers/Home%20Controllers/home_advertise_controller.dart';
import 'package:earn_store/Models/Home%20Models/banner_model.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/button_loading.dart';
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
        return controller.bannerLoading.value
            ? ButtonLoading(
                verticalPadding: 60.h,
              )
            : Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: controller.banners.value!.banner!.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        bannerImage(
                      index: itemIndex,
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
            controller.banners.value!.banner!.length,
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

  Widget bannerImage({required int index}) {
    final HomeAdvertiseController controller = Get.put(
      HomeAdvertiseController(),
    );
    return Obx(
      () {
        BannerModel banners = controller.banners.value!;
        return CachedNetworkImage(
          imageUrl: banners.banner![index].bannerImageUrl.toString(),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          placeholder: (context, url) => const ButtonLoading(
            loadingColor: TextColors.textColor1,
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
