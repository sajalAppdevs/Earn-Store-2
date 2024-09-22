import 'package:earn_store/Controllers/Home%20Controllers/tour_package_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Tour%20Related%20Pages/package_details_page.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TourPackageBox extends StatelessWidget {
  const TourPackageBox({super.key});

  @override
  Widget build(BuildContext context) {
    TourPackageController controller = Get.put(TourPackageController());
    return Obx(
      () {
        return PaddedScreen(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyles.customText(title: "Select Room"),
              SizedBox(height: 10.h),
              ListView.builder(
                itemCount: controller.specificPackages.value!.packages!.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return tourPackageBox(index: index);
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }

  Widget tourPackageBox({required int index}) {
    TourPackageController controller = Get.put(TourPackageController());
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: GlassmorphismCard(
            boxHeight: 130.h,
            verticalPadding: 10.h,
            horizontalPadding: 15.w,
            onPressed: () {
              Get.to(
                PackageDetailsPage(
                  packageID: controller
                      .specificPackages.value!.packages![index].id
                      .toString(),
                ),
              );
            },
            childAlignment: Alignment.centerLeft,
            boxLeftPadding: 20.w,
            child: Row(
              children: [
                NetworkImageWidget(
                  imageUrl: controller
                      .specificPackages.value!.packages![index].image
                      .toString(),
                  height: 95.h,
                  width: 110.w,
                ),
                SizedBox(width: 10.w),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      priceWidget(index: index),
                      SizedBox(height: 8.w),
                      SizedBox(
                        width: 165.w,
                        child: customText(
                            title: controller.specificPackages.value!
                                .packages![index].agencyName
                                .toString()),
                      ),
                      SizedBox(height: 8.w),
                      detailsButton(index: index),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget priceWidget({required int index}) {
    TourPackageController controller = Get.put(TourPackageController());
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 83.w,
              child: customText(
                title: controller
                    .specificPackages.value!.packages![index].packageName
                    .toString(),
              ),
            ),
            SizedBox(
              width: 83.w,
              child: customText(
                title:
                    "\$${controller.specificPackages.value!.packages![index].price.toString()}",
                textAlign: TextAlign.right,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget detailsButton({required int index}) {
    TourPackageController controller = Get.put(TourPackageController());
    return Padding(
      padding: EdgeInsets.only(left: 75.w),
      child: CustomButton(
        height: 30.h,
        width: 90.w,
        onPressed: () {
          Get.to(
            PackageDetailsPage(
              packageID: controller.specificPackages.value!.packages![index].id
                  .toString(),
            ),
          );
        },
        buttonText: "Details",
        textSize: 12.sp,
      ),
    );
  }

  Widget customText({
    required String title,
    TextAlign? textAlign,
  }) {
    return TextStyles.customText(
      title: title,
      fontSize: 13.sp,
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
