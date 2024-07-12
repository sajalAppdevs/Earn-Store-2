import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HotelDetailsTop extends StatelessWidget {
  const HotelDetailsTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        image: const DecorationImage(
          image: AssetImage(
            "${Paths.imagePath}hotel.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: const Column(
        children: [
          CustomTop(title: "Hotel Details"),
        ],
      ),
    );
  }
}
