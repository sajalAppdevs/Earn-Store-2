import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Ecommerce%20Related%20Widgets/extra_category_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExtraCategoryPage extends StatefulWidget {
  const ExtraCategoryPage({
    super.key,
  });

  @override
  State<ExtraCategoryPage> createState() => _ExtraCategoryPageState();
}

class _ExtraCategoryPageState extends State<ExtraCategoryPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(
            title: "Extra Category",
          ),
          PaddedScreen(
            padding: 10.w,
            child: CustomField(
              hintText: "Search",
              controller: TextEditingController(),
              suffixIcon: Icons.search,
            ),
          ),
          SizedBox(height: 15.h),
          extraCategories(),
          SizedBox(height: 15.h),
          const ExtraCategoryBody(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget extraCategories() {
    return PaddedScreen(
      padding: 10.w,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            5,
            (index) => categoryBox(index: index),
          ),
        ),
      ),
    );
  }

  Widget categoryBox({required int index}) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: GlassmorphismCard(
        boxHeight: 75.h,
        boxWidth: 80.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "${Paths.iconPath}fruits.png",
              height: 25.h,
              width: 25.w,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 5.h),
            SizedBox(
              width: 60.w,
              child: TextStyles.customText(
                title: "Drinks & Beverages",
                fontSize: 8.sp,
                isShowAll: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
