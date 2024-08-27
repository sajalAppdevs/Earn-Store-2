import 'package:earn_store/Controllers/Home%20Controllers/popular_courses_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularCourseContent extends StatelessWidget {
  const PopularCourseContent({super.key});

  @override
  Widget build(BuildContext context) {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        return controller.courseDetails.value!.courseContainer!.isEmpty
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStyles.customText(
                    title: "What you will learn by doing the course",
                    fontSize: 14.sp,
                  ),
                  SizedBox(height: 15.h),
                  ListView.builder(
                    itemCount:
                        controller.courseDetails.value!.courseContainer!.length,
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
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              Image.asset(
                "${Paths.iconPath}tick.png",
                height: 20.h,
                width: 20.w,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 10.w),
              SizedBox(
                width: 300.w,
                child: TextStyles.customText(
                  title: controller
                      .courseDetails.value!.courseContainer![index].description
                      .toString(),
                  fontSize: 13.sp,
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
