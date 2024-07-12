import 'package:earn_store/Statics/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FeedBoxContent extends StatelessWidget {
  const FeedBoxContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        image: const DecorationImage(
          image: AssetImage(
            "${Paths.imagePath}feed.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
