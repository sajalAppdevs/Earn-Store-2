import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Home%20Controllers/tour_package_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Tour%20Related%20Pages/package_details_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeTourPackages extends StatelessWidget {
  const HomeTourPackages({super.key});

  @override
  Widget build(BuildContext context) {
    TourPackageController controller = Get.put(
      TourPackageController(),
    );
    return Obx(
      () {
        return controller.packageLoading.value
            ? ButtonLoading(
                verticalPadding: 50.h,
              )
            : Column(
                children: [
                  const TitleText(
                    title: "Tour Packages",
                    hideAll: true,
                  ),
                  SizedBox(height: 70.h),
                  Container(
                    height: 150.h,
                    clipBehavior: Clip.none,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SingleChildScrollView(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          child: Stack(
                            children: [
                              Row(
                                children: List.generate(
                                  controller
                                      .allPackages.value!.packages!.length,
                                  (index) {
                                    return tourBox(index: index);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }

  Widget tourBox({required int index}) {
    TourPackageController controller = Get.put(
      TourPackageController(),
    );
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 35.w),
          child: GlassmorphismCard(
            onPressed: () {
              Get.to(
                PackageDetailsPage(
                  packageID: controller.allPackages.value!.packages![index].id
                      .toString(),
                ),
              );
            },
            boxHeight: 105.h,
            boxWidth: 250.w,
            child: Column(
              children: [
                topInfo(index: index),
              ],
            ),
          ),
        ),
        tourImage(index: index),
      ],
    );
  }

  Widget tourImage({required int index}) {
    TourPackageController controller = Get.put(
      TourPackageController(),
    );
    return Obx(
      () {
        return Positioned(
          top: -30,
          left: 20.w,
          child: CachedNetworkImage(
            imageUrl:
                controller.allPackages.value!.packages![index].image.toString(),
            imageBuilder: (context, imageProvider) => Container(
              clipBehavior: Clip.none,
              height: 95.h,
              width: 110.w,
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
              clipBehavior: Clip.none,
              height: 95.h,
              width: 110.w,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget topInfo({required int index}) {
    TourPackageController controller = Get.put(
      TourPackageController(),
    );
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 10.w,
            top: 10.h,
            bottom: 10.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 80.w),
                  SizedBox(
                    width: 80.w,
                    child: TextStyles.customText(
                      title: controller
                          .allPackages.value!.packages![index].location
                          .toString(),
                      fontSize: 12.sp,
                      isShowAll: true,
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                    child: TextStyles.customText(
                      title:
                          "\$${controller.allPackages.value!.packages![index].price.toString()}",
                      fontSize: 10.sp,
                    ),
                  )
                ],
              ),
              // detailsButton(index: index),
            ],
          ),
        );
      },
    );
  }

  Widget detailsButton({required int index}) {
    return Align(
      alignment: Alignment.centerRight,
      child: GlassmorphismCard(
        boxHeight: 30.h,
        boxWidth: 80.w,
        onPressed: () {},
        child: TextStyles.customText(
          title: "Details",
          fontSize: 10.sp,
        ),
      ),
    );
  }
}
