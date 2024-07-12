import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Food%20Related%20Page/food_details_page.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      child: Column(
        children: [
          topRow(),
          SizedBox(height: 10.h),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 1 / 1.3,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return foodBox(index: index);
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget topRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextStyles.customText(
          title: "Burgers",
        ),
        CustomButton(
          width: 100.w,
          height: 35.h,
          onPressed: () {},
          buttonText: "See All",
          textSize: 14.sp,
        )
      ],
    );
  }

  Widget foodBox({required int index}) {
    return GlassmorphismCard(
      verticalPadding: 15.h,
      onPressed: () {
        Get.to(
          const FoodDetailsPage(),
        );
      },
      child: Column(
        children: [
          Image.asset(
            "${Paths.iconPath}burger.png",
            height: 100.h,
            width: 120.w,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 5.h),
          TextStyles.customText(
            title: "Fried Snacks",
            fontSize: 13.sp,
          ),
          SizedBox(height: 5.h),
          TextStyles.customText(
            title: "BDT 200.00",
            fontSize: 13.sp,
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "${Paths.iconPath}location.png",
                height: 15.h,
                width: 15.w,
              ),
              SizedBox(width: 4.w),
              TextStyles.customText(
                title: "3.21 km",
                fontSize: 13.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
