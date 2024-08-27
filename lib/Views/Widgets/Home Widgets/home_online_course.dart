import 'package:earn_store/Controllers/Home%20Controllers/online_course_controller.dart';
import 'package:earn_store/Models/Home%20Models/online_course_model.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/url_helpers.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_course_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeOnlineCourse extends StatelessWidget {
  const HomeOnlineCourse({super.key});

  @override
  Widget build(BuildContext context) {
    OnlineCourseController controller = Get.put(
      OnlineCourseController(),
    );
    return Obx(
      () {
        return controller.courseLoading.value
            ? ButtonLoading(
                verticalPadding: 60.h,
              )
            : Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                child: GlassmorphismCard(
                  boxHeight: 160.h,
                  verticalPadding: 20.h,
                  horizontalPadding: 20.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleText(
                        title: "Online Course",
                        fontSize: 18.sp,
                        onPressed: () {
                          Get.to(
                            const AllCoursePage(),
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          controller.courses.value!.onlineCourses!.length > 1
                              ? 2
                              : controller.courses.value!.onlineCourses!.length,
                          (index) => courseBox(index: index),
                        ),
                      )
                    ],
                  ),
                ),
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
        OnlineCourseModel courses = controller.courses.value!;
        String name = courses.onlineCourses![index].appName.toString();
        String url =
            controller.courses.value!.onlineCourses![index].link.toString();
        return GestureDetector(
          onTap: () async {
            await UrlHelpers.openUrl(url);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              courseImage(index: index),
              SizedBox(height: 10.h),
              TextStyles.customText(
                title: name,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        );
      },
    );
  }

  Widget courseImage({required int index}) {
    OnlineCourseController controller = Get.put(
      OnlineCourseController(),
    );
    return Obx(
      () {
        OnlineCourseModel courses = controller.courses.value!;
        return NetworkImageWidget(
          imageUrl: courses.onlineCourses![index].icon.toString(),
          height: 33.h,
          width: 100.w,
        );
      },
    );
  }
}
