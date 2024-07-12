import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Tour%20Related%20Pages/package_details_page.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TourPackageBox extends StatelessWidget {
  const TourPackageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextStyles.customText(title: "Select Room"),
          SizedBox(height: 10.h),
          ListView.builder(
            itemCount: 6,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return tourPackageBox(index: index);
            },
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget tourPackageBox({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GlassmorphismCard(
        boxHeight: 130.h,
        verticalPadding: 10.h,
        horizontalPadding: 15.w,
        onPressed: () {
          Get.to(
            const PackageDetailsPage(),
          );
        },
        childAlignment: Alignment.centerLeft,
        boxLeftPadding: 20.w,
        child: Row(
          children: [
            Image.asset(
              "${Paths.iconPath}tour_spot.png",
              height: 95.h,
              width: 110.w,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 10.w),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  priceWidget(),
                  SizedBox(height: 8.w),
                  customText(title: "Flight Experts"),
                  SizedBox(height: 8.w),
                  detailsButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget priceWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(
          title: "3 Days in Bali",
        ),
        SizedBox(width: 50.w),
        customText(
          title: "\$45",
        ),
      ],
    );
  }

  Widget detailsButton() {
    return Padding(
      padding: EdgeInsets.only(left: 75.w),
      child: CustomButton(
        height: 30.h,
        width: 90.w,
        onPressed: () {},
        buttonText: "Details",
        textSize: 12.sp,
      ),
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
      fontSize: 13.sp,
    );
  }
}
