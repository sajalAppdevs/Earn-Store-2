import 'package:earn_store/Controllers/Home%20Controllers/online_course_controller.dart';
import 'package:earn_store/Utils/url_helpers.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllCourseBox extends StatelessWidget {
  const AllCourseBox({super.key});

  @override
  Widget build(BuildContext context) {
    OnlineCourseController controller = Get.put(
      OnlineCourseController(),
    );
    return Obx(
      () {
        return ListView.builder(
          itemCount: controller.courses.value!.onlineCourses!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return courseBox(index: index);
          },
        );
      },
    );
  }

  Widget courseBox({required int index}) {
    OnlineCourseController controller = Get.put(
      OnlineCourseController(),
    );
    return Obx(
      () {
        String imagePath =
            controller.courses.value!.onlineCourses![index].icon.toString();
        String name =
            controller.courses.value!.onlineCourses![index].appName.toString();
        String url =
            controller.courses.value!.onlineCourses![index].link.toString();
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: GlassmorphismCard(
            boxHeight: 130.h,
            onPressed: () async {
              // Get.to(
              //   const AllCourseDetails(),
              // );
              await UrlHelpers.openUrl(url);
            },
            childAlignment: Alignment.centerLeft,
            boxLeftPadding: 20.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NetworkImageWidget(
                  imageUrl: imagePath,
                  height: 40.h,
                  width: 150.w,
                ),
                SizedBox(height: 10.h),
                TextStyles.customText(
                  title: name,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
