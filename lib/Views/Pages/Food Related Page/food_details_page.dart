import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Food%20Related%20Widgets/food_details_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const FoodDetailsTop(title: "Order Details"),
          PaddedScreen(
            child: CustomField(
              hintText: "Search",
              controller: TextEditingController(),
              suffixIcon: Icons.search,
            ),
          ),
          SizedBox(height: 30.h),
          productImage(),
          PaddedScreen(
            child: Column(
              children: [
                SizedBox(height: 30.h),
                productName(),
                SizedBox(height: 15.h),
                customText(title: "Category : Fastfood"),
                SizedBox(height: 15.h),
                customText(title: "Product ID : hgfy2ww5"),
                SizedBox(height: 15.h),
                locationWidget(),
                SizedBox(height: 30.h),
                productDescriptionTitle(),
                SizedBox(height: 15.h),
                TextStyles.customText(
                  title:
                      "The Fruit Bowl is a simple bowl full of seasonal fruits chopped to bite size. This is a bowl full of healthy ingredients like Strawberries,  Green Grapes,  Orange , peeled, chopped coarsely",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  isShowAll: true,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  onPressed: () {},
                  buttonText: "Order Now",
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productImage() {
    return PaddedScreen(
      padding: 30.w,
      child: GlassmorphismCard(
        boxHeight: 200.h,
        boxWidth: 300.w,
        child: Image.asset(
          "${Paths.iconPath}burger.png",
          height: 170.h,
          width: 270.w,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget productName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(title: "Double cheese Burger"),
        TextStyles.customText(
          title: "BDT : 320.00",
          fontWeight: FontWeight.w700,
          fontSize: 15.sp,
        ),
      ],
    );
  }

  Widget customText({required String title}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextStyles.customText(
        title: title,
        fontSize: 15.sp,
      ),
    );
  }

  Widget locationWidget() {
    return Row(
      children: [
        Image.asset(
          "${Paths.iconPath}location.png",
          height: 20.h,
          width: 18.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 5.w),
        TextStyles.customText(
          title: "4km",
          fontSize: 14.sp,
        )
      ],
    );
  }

  Widget productDescriptionTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(title: "Product Description"),
        CustomButton(
          height: 35.h,
          width: 120.w,
          onPressed: () {},
          buttonText: "Check Reviews",
          textSize: 10.sp,
        )
      ],
    );
  }
}
