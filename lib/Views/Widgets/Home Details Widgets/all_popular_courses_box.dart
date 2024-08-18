import 'package:earn_store/Controllers/Home%20Controllers/popular_courses_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/popular_course_details.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllPopularCoursesBox extends StatelessWidget {
  const AllPopularCoursesBox({super.key});

  @override
  Widget build(BuildContext context) {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        return ListView.builder(
          itemCount: controller.courses.value!.onlineCourses!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return popularCoursesBox(index: index);
          },
        );
      },
    );
  }

  Widget popularCoursesBox({required int index}) {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        String imagePath =
            controller.courses.value!.onlineCourses![index].icon.toString();
        String name =
            controller.courses.value!.onlineCourses![index].appName.toString();
        return Padding(
          padding: EdgeInsets.only(bottom: 15.w),
          child: GlassmorphismCard(
            boxHeight: 100.h,
            horizontalPadding: 10.w,
            verticalPadding: 10.h,
            onPressed: () {
              Get.to(const PopularCourseDetails());
            },
            child: Row(
              children: [
                courseImage(imagePath: imagePath),
                SizedBox(width: 5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextStyles.customText(
                      title: name,
                      fontSize: 15.sp,
                    ),
                    SizedBox(height: 5.h),
                    TextStyles.customText(
                      title: "Hasnain Nur Sezan  +4",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 5.h),
                    TextStyles.customText(
                      title: "For Class VI    Free",
                      fontSize: 13.sp,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget courseImage({required String imagePath}) {
    return NetworkImageWidget(
      imageUrl: imagePath,
      height: 75.h,
      width: 130.w,
    );
  }
}
