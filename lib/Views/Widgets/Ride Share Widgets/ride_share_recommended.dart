import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Ride%20Share%20Pages/ride_vehicle_details.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RideShareRecommended extends StatelessWidget {
  const RideShareRecommended({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      child: Column(
        children: [
          topTitle(),
          SizedBox(height: 10.h),
          ListView.builder(
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return vehicleBox(index: index);
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget topTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextStyles.customText(
          title: "Recommended",
        ),
        CustomButton(
          height: 35.h,
          width: 100.w,
          onPressed: () {},
          buttonText: "See All",
          textSize: 14.sp,
        )
      ],
    );
  }

  Widget vehicleBox({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GlassmorphismCard(
        boxHeight: 120.h,
        verticalPadding: 15.h,
        horizontalPadding: 15.w,
        onPressed: () {
          Get.to(
            const RideVehicleDetails(),
          );
        },
        child: Row(
          children: [
            Image.asset(
              "${Paths.iconPath}car.png",
              height: 90.h,
              width: 100.w,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vehicleTopInfo(),
                SizedBox(height: 10.h),
                customText(title: "1 min away . 1 : 30 PM"),
                SizedBox(height: 10.h),
                customText(title: "Affordable everyday rides"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget vehicleTopInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(title: "UberX"),
        SizedBox(width: 15.w),
        vehicleCapacity(),
        SizedBox(width: 15.w),
        customText(title: "BDT 250.00")
      ],
    );
  }

  Widget vehicleCapacity() {
    return Row(
      children: [
        Icon(
          Icons.person_2_outlined,
          color: TextColors.textColor1,
          size: 17.sp,
        ),
        customText(title: "0"),
      ],
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
      fontSize: 12.sp,
    );
  }
}
