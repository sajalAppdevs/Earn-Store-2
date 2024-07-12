import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PackageDetailsTop extends StatelessWidget {
  const PackageDetailsTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265.h,
      width: Get.width,
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "${Paths.iconPath}tour_spot.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: const CustomTop(
        title: "Package Details",
      ),
    );
  }
}
