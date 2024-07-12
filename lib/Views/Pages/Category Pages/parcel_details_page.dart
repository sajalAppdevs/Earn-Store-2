import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ParcelDetails extends StatelessWidget {
  const ParcelDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Parcel Booking"),
          parcelImage(),
          parcelInfo(),
          SizedBox(height: 50.h),
          buttonRow()
        ],
      ),
    );
  }

  Widget parcelImage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Image.asset(
        "${Paths.iconPath}pathao.png",
        height: 145.h,
        width: Get.width,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget parcelInfo() {
    return PaddedScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextStyles.customText(
            title: "REDX",
          ),
          SizedBox(height: 10.h),
          TextStyles.customText(
            title:
                "One of the best delivery services in Bangladesh. Package starts from 125.00৳",
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            isShowAll: true,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget buttonRow() {
    return PaddedScreen(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            width: 150.w,
            onPressed: () {},
            buttonText: "Refer",
          ),
          CustomButton(
            width: 150.w,
            onPressed: () {},
            buttonText: "Book Now",
          ),
        ],
      ),
    );
  }
}
