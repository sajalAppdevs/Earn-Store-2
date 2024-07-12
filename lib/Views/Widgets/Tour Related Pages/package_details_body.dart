import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PackageDetailsBody extends StatelessWidget {
  const PackageDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismCard(
      boxHeight: Get.height * 0.95,
      verticalPadding: 20.h,
      horizontalPadding: 20.w,
      child: Column(
        children: [
          locationWidget(),
          SizedBox(height: 20.h),
          titleAndDetails(),
          SizedBox(height: 20.h),
          packageContain(),
          SizedBox(height: 50.h),
          buttonRow(),
        ],
      ),
    );
  }

  Widget locationWidget() {
    return Row(
      children: [
        Image.asset(
          "${Paths.iconPath}location.png",
          height: 15.h,
          width: 12.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 5.w),
        TextStyles.customText(
          title: "Sea pearl Beach Resort & Spa Cox’s Bazar",
          fontSize: 12.sp,
        )
      ],
    );
  }

  Widget titleAndDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyles.customText(
          title: "Cox’s Bazar Tour",
        ),
        SizedBox(height: 20.h),
        TextStyles.customText(
          title:
              "Cox’s Bazar is a town on the southeast coast of Bangladesh. It’s known for its very long, sandy beachfront, stretching from Sea Beach in the north to Kolatoli Beach in the south.",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          isShowAll: true,
          textAlign: TextAlign.left,
        )
      ],
    );
  }

  Widget packageContain() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyles.customText(
          title: "Package Contains",
        ),
        SizedBox(height: 20.h),
        containWidget(title: "3 Nights accommodation at Sea Pearl Hotel"),
        containWidget(title: "All day Breakfast at Hotel "),
        containWidget(title: "2 Breakfast, 2 Lunch, 2 Dinner"),
        containWidget(title: "Inani Beach tour with Lunch"),
        containWidget(title: "Radiant Fish World"),
        containWidget(title: "Himchori"),
        containWidget(title: "Marine Drive"),
        containWidget(title: "Mermaid Beach Resort"),
        containWidget(title: "Sonadia Island"),
        containWidget(title: "Laboni Beach"),
        containWidget(title: "100 Feet Buddha"),
      ],
    );
  }

  Widget containWidget({required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Image.asset(
              "${Paths.iconPath}tick.png",
              height: 13.h,
              width: 13.w,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 5.w),
          SizedBox(
            width: 300.w,
            child: TextStyles.customText(
              title: title,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              isShowAll: true,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }

  Widget buttonRow() {
    return Row(
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
          buttonText: "Book",
        ),
      ],
    );
  }
}
