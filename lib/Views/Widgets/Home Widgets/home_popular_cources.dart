import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Home%20Controllers/popular_courses_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
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
                    const TitleText(title: "Popular Courses"),
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
            controller.courses.value!.onlineCourses!.length > 3
                ? 3
                : controller.courses.value!.onlineCourses!.length,
            (index) {
              String imagePath = controller
                  .courses.value!.onlineCourses![index].icon
                  .toString();
              String name = controller
                  .courses.value!.onlineCourses![index].appName
                  .toString();
              return Padding(
                padding: EdgeInsets.only(bottom: 15.w),
                child: GlassmorphismCard(
                  boxHeight: 100.h,
                  horizontalPadding: 10.w,
                  verticalPadding: 10.h,
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
          ),
        );
      },
    );
  }

  Widget courseImage({required String imagePath}) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder: (context, imageProvider) => Container(
        height: 75.h,
        width: 130.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => const ButtonLoading(
        loadingColor: TextColors.textColor1,
      ),
      errorWidget: (context, url, error) => Container(
        height: 75.h,
        width: 130.w,
        color: Colors.grey,
      ),
    );
  }
}
