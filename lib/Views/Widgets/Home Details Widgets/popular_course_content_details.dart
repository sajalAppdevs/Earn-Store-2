import 'package:earn_store/Controllers/Home%20Controllers/popular_courses_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularCourseContentDetails extends StatelessWidget {
  const PopularCourseContentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        return controller.courseDetails.value!.courseDetails!.isEmpty
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStyles.customText(
                    title: "Course Details",
                  ),
                  SizedBox(height: 15.h),
                  ListView.builder(
                    itemCount: controller.courseDetails.value!.courseDetails![0]
                        .description!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return contentBox(index: index);
                    },
                  )
                ],
              );
      },
    );
  }

  Widget contentBox({required int index}) {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Row(
            children: [
              Container(
                height: 10.h,
                width: 10.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: TextColors.textColor1,
                ),
              ),
              SizedBox(width: 8.w),
              SizedBox(
                width: 300.w,
                child: TextStyles.customText(
                  title: controller.courseDetails.value!.courseDetails![0]
                      .description![index]
                      .toString(),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  isShowAll: true,
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
