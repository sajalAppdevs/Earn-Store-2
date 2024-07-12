import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Tour%20Related%20Pages/tour_package_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TourBox extends StatelessWidget {
  const TourBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return tourBox(index: index);
      },
    );
  }

  Widget tourBox({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: GlassmorphismCard(
        boxHeight: 176.h,
        verticalPadding: 10.h,
        horizontalPadding: 15.w,
        onPressed: () {
          Get.to(
            const TourPackagePage(),
          );
        },
        childAlignment: Alignment.centerLeft,
        boxLeftPadding: 20.w,
        child: Image.asset(
          "${Paths.iconPath}flight.png",
          height: 150.h,
          width: Get.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
