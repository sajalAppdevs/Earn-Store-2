import 'package:earn_store/Controllers/Home%20Controllers/tour_agency_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Tour%20Related%20Pages/tour_package_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TourBox extends StatelessWidget {
  const TourBox({super.key});

  @override
  Widget build(BuildContext context) {
    TourAgencyController controller = Get.put(TourAgencyController());
    return Obx(
      () {
        return ListView.builder(
          itemCount: controller.allAgencies.value!.agencys!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return tourBox(index: index);
          },
        );
      },
    );
  }

  Widget tourBox({required int index}) {
    TourAgencyController controller = Get.put(TourAgencyController());
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: GlassmorphismCard(
            boxHeight: 176.h,
            verticalPadding: 10.h,
            horizontalPadding: 15.w,
            onPressed: () {
              debugPrint(
                  "AgencyID: ${controller.allAgencies.value!.agencys![index].id}");
              Get.to(
                TourPackagePage(
                  agencyID: controller.allAgencies.value!.agencys![index].id
                      .toString(),
                ),
              );
            },
            childAlignment: Alignment.centerLeft,
            boxLeftPadding: 20.w,
            child: NetworkImageWidget(
              imageUrl: controller.allAgencies.value!.agencys![index].image
                  .toString(),
              height: 150.h,
              width: Get.width,
            ),
          ),
        );
      },
    );
  }
}
