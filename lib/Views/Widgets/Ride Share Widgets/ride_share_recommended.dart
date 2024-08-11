import 'package:earn_store/Controllers/Car%20Controllers/car_by_shop_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Ride%20Share%20Pages/ride_vehicle_details.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RideShareRecommended extends StatelessWidget {
  const RideShareRecommended({super.key});

  @override
  Widget build(BuildContext context) {
    CarByShopController controller = Get.put(CarByShopController());
    return Obx(
      () {
        return PaddedScreen(
          child: Column(
            children: [
              topTitle(),
              SizedBox(height: 10.h),
              ListView.builder(
                itemCount: controller.cars.value!.data!.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return vehicleBox(index: index);
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }

  Widget topTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextStyles.customText(
          title: "Recommended",
        ),
        CustomButton(
          height: 35.h,
          width: 100.w,
          onPressed: () {},
          buttonText: "See All",
          textSize: 14.sp,
        )
      ],
    );
  }

  Widget vehicleBox({required int index}) {
    CarByShopController controller = Get.put(CarByShopController());
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: GlassmorphismCard(
            boxHeight: 120.h,
            verticalPadding: 15.h,
            horizontalPadding: 15.w,
            onPressed: () {
              Get.to(
                RideVehicleDetails(
                  carID: controller.cars.value!.data![index].id.toString(),
                ),
              );
            },
            child: Row(
              children: [
                NetworkImageWidget(
                  imageUrl:
                      controller.cars.value!.data![index].image.toString(),
                  height: 90.h,
                  width: 100.w,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vehicleTopInfo(index: index),
                    SizedBox(height: 10.h),
                    customText(title: "1 min away . 1 : 30 PM"),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: 175.w,
                      child: customText(
                        title: controller.cars.value!.data![index].description
                            .toString(),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget vehicleTopInfo({required int index}) {
    CarByShopController controller = Get.put(CarByShopController());
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(
                title: controller.cars.value!.data![index].name.toString()),
            SizedBox(width: 15.w),
            vehicleCapacity(index: index),
            SizedBox(width: 15.w),
            customText(
                title: "BDT ${controller.cars.value!.data![index].price}")
          ],
        );
      },
    );
  }

  Widget vehicleCapacity({required int index}) {
    CarByShopController controller = Get.put(CarByShopController());
    return Obx(
      () {
        return Row(
          children: [
            Icon(
              Icons.person_2_outlined,
              color: TextColors.textColor1,
              size: 17.sp,
            ),
            customText(
              title: controller.cars.value!.data![index].seat.toString(),
            ),
          ],
        );
      },
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
      fontSize: 12.sp,
      textAlign: TextAlign.left,
    );
  }
}
