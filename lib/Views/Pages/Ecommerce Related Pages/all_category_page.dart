import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Ecommerce%20Related%20Widgets/all_category_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoryPage extends StatelessWidget {
  const AllCategoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(
            title: "All Category",
          ),
          SizedBox(height: 10.h),
          const AllCategoryBody(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
