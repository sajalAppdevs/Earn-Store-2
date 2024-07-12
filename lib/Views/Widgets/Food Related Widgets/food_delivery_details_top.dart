import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodDeliveryDetailsTop extends StatelessWidget {
  final double? topPadding;
  final double? leftPadding;
  final double? rightPadding;
  final double? bottomPadding;
  const FoodDeliveryDetailsTop({
    super.key,
    this.topPadding,
    this.leftPadding,
    this.rightPadding,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding ?? 10.h,
        left: leftPadding ?? 10.w,
        right: rightPadding ?? 10.w,
        bottom: bottomPadding ?? 20.h,
      ),
      child: GlassmorphismCard(
        boxHeight: 60.h,
        boxWidth: Get.width,
        boxRightPadding: 20.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 10.w),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: TextColors.textColor1,
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                Image.asset(
                  "${Paths.iconPath}foodpanda.png",
                  height: 26.h,
                  width: 134.w,
                  fit: BoxFit.fill,
                )
              ],
            ),
            Image.asset(
              "${Paths.iconPath}location.png",
              height: 25.h,
              width: 19.w,
            )
          ],
        ),
      ),
    );
  }
}
