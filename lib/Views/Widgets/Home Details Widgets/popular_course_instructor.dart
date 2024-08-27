import 'package:earn_store/Controllers/Home%20Controllers/popular_courses_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularCourseInstructor extends StatelessWidget {
  const PopularCourseInstructor({super.key});

  @override
  Widget build(BuildContext context) {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        return controller.courseDetails.value!.instructor!.isEmpty
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStyles.customText(
                    title: "Course Instructor",
                  ),
                  SizedBox(height: 15.h),
                  ListView.builder(
                    itemCount:
                        controller.courseDetails.value!.instructor!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return instructorBox(index: index);
                    },
                  )
                ],
              );
      },
    );
  }

  Widget instructorBox({required int index}) {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Row(
            children: [
              NetworkImageWidget(
                imageUrl: controller
                    .courseDetails.value!.instructor![index].image
                    .toString(),
                height: 60.h,
                width: 70.w,
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStyles.customText(
                    title: controller
                        .courseDetails.value!.instructor![index].name
                        .toString(),
                    fontSize: 14.sp,
                  ),
                  TextStyles.customText(
                    title: controller
                        .courseDetails.value!.instructor![index].designation
                        .toString(),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
