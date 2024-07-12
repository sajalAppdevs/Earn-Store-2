import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Level"),
          SizedBox(height: 20.h),
          levelBox(),
        ],
      ),
    );
  }

  Widget levelBox() {
    return PaddedScreen(
      child: GlassmorphismCard(
        boxHeight: 160.h,
        verticalPadding: 15.h,
        horizontalPadding: 20.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageAndInfo(),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextStyles.customText(
                  title: "Level 04",
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
                CustomButton(
                  width: 115.w,
                  onPressed: () {},
                  buttonText: "Withdraw",
                  textSize: 15.sp,
                )
              ],
            ),
            SizedBox(height: 5.h),
            TextStyles.customText(
              title: "20 July 2024",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }

  Widget imageAndInfo() {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                "${Paths.imagePath}blank_image.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextStyles.customText(
              title: "Rashidatul Kobra",
              fontSize: 14.sp,
            ),
            TextStyles.customText(
              title: "kobrarashi@gmail.com",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        )
      ],
    );
  }
}
