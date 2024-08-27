import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListCart extends StatelessWidget {
  const ProductListCart({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      padding: 10.w,
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return productBox(index: index);
        },
      ),
    );
  }

  Widget productBox({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: GlassmorphismCard(
        boxHeight: 130.h,
        boxWidth: 330.w,
        verticalPadding: 10.h,
        horizontalPadding: 10.w,
        child: Row(
          children: [
            productImage(index: index),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                nameAndPrice(index: index),
                SizedBox(height: 10.h),
                quantityBox(index: index),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget productImage({required int index}) {
    return Image.asset(
      "${Paths.imagePath}product.jpg",
      height: 90.h,
      width: 120.w,
      fit: BoxFit.fill,
    );
  }

  Widget nameAndPrice({required int index}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyles.customText(
          title: "Round Potato",
          fontSize: 14.sp,
        ),
        SizedBox(height: 5.h),
        TextStyles.customText(
          title: "160.00৳",
          fontSize: 14.sp,
        ),
      ],
    );
  }

  Widget quantityBox({required int index}) {
    return Padding(
      padding: EdgeInsets.only(left: 70.w),
      child: Row(
        children: [
          GlassmorphismCard(
            boxHeight: 35.h,
            boxWidth: 35.w,
            borderRadius: 0,
            child: Icon(
              Icons.remove,
              size: 25.sp,
              color: TextColors.textColor1,
            ),
          ),
          SizedBox(width: 5.w),
          GlassmorphismCard(
            boxHeight: 35.h,
            boxWidth: 35.w,
            borderRadius: 0,
            child: TextStyles.customText(
              title: "1",
              fontSize: 22.sp,
            ),
          ),
          SizedBox(width: 5.w),
          GlassmorphismCard(
            boxHeight: 35.h,
            boxWidth: 35.w,
            borderRadius: 0,
            child: Icon(
              Icons.add,
              size: 25.sp,
              color: TextColors.textColor1,
            ),
          ),
        ],
      ),
    );
  }
}
