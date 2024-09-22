import 'package:earn_store/Controllers/Home%20Controllers/all_agency_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/agency_details.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_agency_page.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeAgency extends StatelessWidget {
  const HomeAgency({super.key});

  @override
  Widget build(BuildContext context) {
    AllAgencyController controller = Get.put(
      AllAgencyController(),
    );
    return Obx(
      () {
        return controller.agencyLoading.value
            ? ButtonLoading(
                verticalPadding: 50.h,
              )
            : Column(
                children: [
                  TitleText(
                    title: "Agency",
                    onPressed: () {
                      Get.to(
                        const AllAgencyPage(),
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  agencies(),
                ],
              );
      },
    );
  }

  Widget agencies() {
    AllAgencyController controller = Get.put(
      AllAgencyController(),
    );
    return Obx(
      () {
        return Column(
          children: List.generate(
            controller.agencies.value!.agencys!.length > 3
                ? 3
                : controller.agencies.value!.agencys!.length,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 15.w),
              child: GlassmorphismCard(
                onPressed: () {
                  Get.to(
                    AgencyDetails(
                      index: index,
                    ),
                  );
                },
                boxHeight: 150.h,
                child: agencyImage(
                  imagePath: controller.agencies.value!.agencys![index].image
                      .toString(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget agencyImage({required String imagePath}) {
    return NetworkImageWidget(
      imageUrl: imagePath,
      height: 130.h,
      width: 285.w,
    );
  }
}
