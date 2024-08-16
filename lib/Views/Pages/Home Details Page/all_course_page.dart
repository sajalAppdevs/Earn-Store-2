import 'package:earn_store/Utils/url_helpers.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/all_course_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCoursePage extends StatelessWidget {
  const AllCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Online Courses"),
          PaddedScreen(
            child: Column(
              children: [
                const AllCourseBox(),
                SizedBox(height: 40.h),
                CustomButton(
                  onPressed: () async {
                    await UrlHelpers.shareOnSocialMedia(
                        url:
                            "https://earnstor.lens-ecom.store/?refer=34?id=45");
                  },
                  buttonText: "Refer",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
