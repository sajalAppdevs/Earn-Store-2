import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Ecommerce%20Related%20Widgets/sub_category_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryPage extends StatelessWidget {
  final String mainCatID;
  const SubCategoryPage({
    super.key,
    required this.mainCatID,
  });

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(
            title: "Sub Category",
          ),
          SizedBox(height: 10.h),
          SubCategoryBody(
            mainCatID: mainCatID,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
