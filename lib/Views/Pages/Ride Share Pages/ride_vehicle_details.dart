import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RideVehicleDetails extends StatelessWidget {
  const RideVehicleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Details"),
          PaddedScreen(
            child: CustomField(
              hintText: "Search",
              controller: TextEditingController(),
              suffixIcon: Icons.search,
            ),
          ),
          SizedBox(height: 20.h),
          infoBox(),
          SizedBox(height: 50.h),
          buttonRow(),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  Widget infoBox() {
    return PaddedScreen(
      padding: 10.w,
      child: GlassmorphismCard(
        verticalPadding: 15.h,
        horizontalPadding: 15.w,
        boxHeight: 490.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "${Paths.iconPath}car.png",
              height: 180.h,
              width: Get.width,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 15.h),
            vehicleTopInfo(),
            SizedBox(height: 10.h),
            vehicleCapacity(),
            SizedBox(height: 15.h),
            customText2(title: "1 min away . 1 : 30 PM"),
            SizedBox(height: 15.h),
            customText2(title: "Affordable everyday rides"),
            SizedBox(height: 20.h),
            customText(title: "Description"),
            SizedBox(height: 15.h),
            customText2(
              title:
                  "You can also refer to someone who is riding a horse, a bicycle, or a motorcycle as a rider.",
            ),
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
        customText2(title: "BDT 250.00"),
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
            buttonText: "Book",
          ),
        ],
      ),
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
    );
  }

  Widget customText2({required String title}) {
    return TextStyles.customText(
      title: title,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      isShowAll: true,
      textAlign: TextAlign.left,
    );
  }
}
