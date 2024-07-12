import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Category%20Pages/parcel_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ParcelBox extends StatelessWidget {
  const ParcelBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return parcelBox(index: index);
      },
    );
  }

  Widget parcelBox({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      child: GlassmorphismCard(
        boxHeight: 150.h,
        verticalPadding: 10.h,
        horizontalPadding: 15.w,
        onPressed: () {
          Get.to(
            const ParcelDetails(),
          );
        },
        childAlignment: Alignment.centerLeft,
        boxLeftPadding: 20.w,
        child: Image.asset(
          "${Paths.iconPath}pathao.png",
          height: 133.h,
          width: Get.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
