import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/all_course_details_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCourseDetails extends StatelessWidget {
  const AllCourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Ten Minute School"),
          SizedBox(height: 10.h),
          PaddedScreen(
            padding: 10.w,
            child: Column(
              children: [
                SizedBox(height: 10.h),
                const AllCourseDetailsBox(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
