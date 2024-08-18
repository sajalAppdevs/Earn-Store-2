import 'package:earn_store/Controllers/Home%20Controllers/tour_package_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Utils/url_helpers.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PackageDetailsBody extends StatelessWidget {
  const PackageDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismCard(
      boxHeight: Get.height * 0.95,
      verticalPadding: 20.h,
      horizontalPadding: 20.w,
      child: Column(
        children: [
          locationWidget(),
          SizedBox(height: 20.h),
          titleAndDetails(),
          SizedBox(height: 20.h),
          packageContain(),
          SizedBox(height: 50.h),
          buttonRow(),
        ],
      ),
    );
  }

  Widget locationWidget() {
    TourPackageController controller = Get.put(TourPackageController());
    return Obx(
      () {
        return Row(
          children: [
            Image.asset(
              "${Paths.iconPath}location.png",
              height: 15.h,
              width: 12.w,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 5.w),
            TextStyles.customText(
              title:
                  "${controller.packageDetails.value!.packages![0].packageName} in ${controller.packageDetails.value!.packages![0].location}",
              fontSize: 12.sp,
            )
          ],
        );
      },
    );
  }

  Widget titleAndDetails() {
    TourPackageController controller = Get.put(TourPackageController());
    return Obx(
      () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextStyles.customText(
                title:
                    "${controller.packageDetails.value!.packages![0].location} Tour",
              ),
            ),
            SizedBox(height: 20.h),
            TextStyles.customText(
              title: controller.packageDetails.value!.packages![0].facilities
                  .toString(),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              isShowAll: true,
              textAlign: TextAlign.left,
            )
          ],
        );
      },
    );
  }

  Widget packageContain() {
    TourPackageController controller = Get.put(TourPackageController());
    return Obx(
      () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextStyles.customText(
              title: "Package Contains",
            ),
            SizedBox(height: 20.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller
                  .packageDetails.value!.packages![0].packageContainer!.length,
              itemBuilder: (BuildContext context, int index) {
                return containWidget(
                  title: controller.packageDetails.value!.packages![0]
                      .packageContainer![index]
                      .toString(),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget containWidget({required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Image.asset(
              "${Paths.iconPath}tick.png",
              height: 13.h,
              width: 13.w,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 5.w),
          SizedBox(
            width: 300.w,
            child: TextStyles.customText(
              title: title,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              isShowAll: true,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }

  Widget buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          width: 150.w,
          onPressed: () async {
            await UrlHelpers.shareOnSocialMedia(
                url: "https://earnstor.lens-ecom.store/?refer=34?id=45");
          },
          buttonText: "Refer",
        ),
        CustomButton(
          width: 150.w,
          onPressed: () {
            Snackbars.successSnackBar(
                title: "Booking Status", description: "Sended To Admin");
            Get.offAll(
              const RootScreen(),
            );
          },
          buttonText: "Book",
        ),
      ],
    );
  }
}
