import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Ecommerce%20Related%20Pages/sub_category_page.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllCategoryBody extends StatelessWidget {
  const AllCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      padding: 10.w,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 0.5,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
        ),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return categoryBox(index: index);
        },
      ),
    );
  }

  Widget categoryBox({required int index}) {
    return GlassmorphismCard(
      horizontalPadding: 10.w,
      onPressed: () {
        Get.to(
          const SubCategoryPage(),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 80.w,
            child: TextStyles.customText(
              title: "Fruits",
              fontSize: 10.sp,
              isShowAll: true,
              textAlign: TextAlign.left,
            ),
          ),
          Image.asset(
            "${Paths.iconPath}fruits.png",
            height: 60.h,
            width: 60.w,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
