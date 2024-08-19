import 'package:earn_store/Controllers/Home%20Controllers/parcel_delivery_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Category%20Pages/parcel_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ParcelBox extends StatelessWidget {
  const ParcelBox({super.key});

  @override
  Widget build(BuildContext context) {
    ParcelDeliveryController controller = Get.put(
      ParcelDeliveryController(),
    );
    return Obx(
      () {
        return ListView.builder(
          itemCount: controller.parcels.value!.deliveryCompany!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return parcelBox(index: index);
          },
        );
      },
    );
  }

  Widget parcelBox({required int index}) {
    ParcelDeliveryController controller = Get.put(
      ParcelDeliveryController(),
    );
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
          child: GlassmorphismCard(
            boxHeight: 150.h,
            verticalPadding: 10.h,
            horizontalPadding: 15.w,
            onPressed: () {
              Get.to(
                ParcelDetails(
                  index: index,
                ),
              );
            },
            childAlignment: Alignment.centerLeft,
            boxLeftPadding: 20.w,
            child: NetworkImageWidget(
              imageUrl: controller.parcels.value!.deliveryCompany![index].image
                  .toString(),
              height: 133.h,
              width: Get.width,
            ),
          ),
        );
      },
    );
  }
}
