import 'package:earn_store/Controllers/Home%20Controllers/all_agency_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/agency_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllAgencyBox extends StatelessWidget {
  const AllAgencyBox({super.key});

  @override
  Widget build(BuildContext context) {
    AllAgencyController controller = Get.put(
      AllAgencyController(),
    );
    return Obx(
      () {
        return ListView.builder(
          itemCount: controller.agencies.value!.agencys!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return agencyBox(index: index);
          },
        );
      },
    );
  }

  Widget agencyBox({required int index}) {
    AllAgencyController controller = Get.put(
      AllAgencyController(),
    );
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5.h,
          ),
          child: GlassmorphismCard(
            boxHeight: 175.h,
            boxRightPadding: 15.w,
            onPressed: () {
              Get.to(
                const AgencyDetails(),
              );
            },
            childAlignment: Alignment.centerLeft,
            boxLeftPadding: 20.w,
            child: agencyImage(
              imagePath:
                  controller.agencies.value!.agencys![index].image.toString(),
            ),
          ),
        );
      },
    );
  }

  Widget agencyImage({required String imagePath}) {
    return NetworkImageWidget(
      imageUrl: imagePath,
      height: 150.h,
      width: 300.w,
    );
  }
}
