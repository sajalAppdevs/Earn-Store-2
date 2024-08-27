import 'package:earn_store/Controllers/Home%20Controllers/popular_courses_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_popular_courses.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/popular_course_details.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePopularCources extends StatelessWidget {
  const HomePopularCources({super.key});

  @override
  Widget build(BuildContext context) {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        return controller.courseLoading.value
            ? ButtonLoading(
                verticalPadding: 50.h,
              )
            : Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Column(
                  children: [
                    TitleText(
                      title: "Popular Courses",
                      onPressed: () {
                        Get.to(
                          const AllPopularCourses(),
                        );
                      },
                    ),
                    SizedBox(height: 10.h),
                    cources(),
                  ],
                ),
              );
      },
    );
  }

  Widget cources() {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        return Column(
          children: List.generate(
            controller.courses.value!.courses!.length > 3
                ? 3
                : controller.courses.value!.courses!.length,
            (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 15.w),
                child: GlassmorphismCard(
                  boxHeight: 100.h,
                  horizontalPadding: 10.w,
                  verticalPadding: 10.h,
                  onPressed: () {
                    Get.to(
                      PopularCourseDetails(
                        courseID: controller.courses.value!.courses![index].id
                            .toString(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      courseImage(
                        imagePath: controller
                            .courses.value!.courses![index].image
                            .toString(),
                      ),
                      SizedBox(width: 5.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextStyles.customText(
                            title: controller
                                .courses.value!.courses![index].title
                                .toString(),
                            fontSize: 15.sp,
                          ),
                          SizedBox(height: 5.h),
                          TextStyles.customText(
                            title: controller
                                .courses.value!.courses![index].instructor
                                .toString(),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 5.h),
                          TextStyles.customText(
                            title:
                                "Duration: ${controller.courses.value!.courses![index].duration}",
                            fontSize: 13.sp,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
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
