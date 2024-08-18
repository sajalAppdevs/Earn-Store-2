import 'package:earn_store/Controllers/Home%20Controllers/tour_package_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PackageDetailsTop extends StatelessWidget {
  const PackageDetailsTop({super.key});

  @override
  Widget build(BuildContext context) {
    TourPackageController controller = Get.put(TourPackageController());
    return Obx(
      () {
        return Container(
          height: 265.h,
          width: Get.width,
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
              image: NetworkImage(
                controller.packageDetails.value!.packages![0].image.toString(),
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: const CustomTop(
            title: "Package Details",
          ),
        );
      },
    );
  }
}
