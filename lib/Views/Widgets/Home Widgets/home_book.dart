import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Book%20Related%20Pages/book_category_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeBook extends StatelessWidget {
  const HomeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GlassmorphismCard(
            boxHeight: 41.h,
            boxWidth: 150.w,
            onPressed: () {
              Get.to(
                const BookCategoryPage(),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "${Paths.iconPath}refer_book.png",
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 10.w),
                TextStyles.customText(
                  title: "Refer Book",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
          ),
          GlassmorphismCard(
            boxHeight: 41.h,
            boxWidth: 150.w,
            onPressed: () {
              Get.to(
                const BookCategoryPage(),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "${Paths.iconPath}buy_book.png",
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 10.w),
                TextStyles.customText(
                  title: "Buy Book",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
