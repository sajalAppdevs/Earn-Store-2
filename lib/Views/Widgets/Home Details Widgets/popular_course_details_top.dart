import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Home%20Controllers/popular_courses_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularCourseDetailsTop extends StatelessWidget {
  const PopularCourseDetailsTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        courseVideoImage(),
        SizedBox(height: 15.h),
        priceAndEnrollButton(),
        nameAndDescription(),
        SizedBox(height: 15.h),
        courseProperties(),
      ],
    );
  }

  Widget courseVideoImage() {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        return CachedNetworkImage(
          imageUrl: controller.courseDetails.value!.course!.image.toString(),
          imageBuilder: (context, imageProvider) => Container(
            height: 160.h,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          placeholder: (context, url) => ButtonLoading(verticalPadding: 50.h),
          errorWidget: (context, url, error) => Container(
            height: 160.h,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
        );
      },
    );
  }

  Widget priceAndEnrollButton() {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TextStyles.customText(
                  title:
                      "৳${controller.courseDetails.value!.course!.discountedPrice}",
                  fontSize: 18.sp,
                ),
                SizedBox(width: 5.w),
                TextStyles.customText(
                  title: "৳${controller.courseDetails.value!.course!.price}",
                  fontSize: 14.sp,
                  discountText: true,
                ),
              ],
            ),
            CustomButton(
              height: 35.h,
              width: 100.w,
              onPressed: () {},
              buttonText: "Enroll",
            )
          ],
        );
      },
    );
  }

  Widget nameAndDescription() {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            Align(
              alignment: Alignment.centerLeft,
              child: TextStyles.customText(
                title: controller.courseDetails.value!.course!.title.toString(),
              ),
            ),
            SizedBox(height: 15.h),
            TextStyles.customText(
              title: controller.courseDetails.value!.course!.description
                  .toString(),
              fontSize: 14.sp,
              isShowAll: true,
              textAlign: TextAlign.left,
            )
          ],
        );
      },
    );
  }

  Widget courseProperties() {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        return Column(
          children: [
            propertiesBox(
              iconPath: "enroll.png",
              title:
                  "${controller.courseDetails.value!.course!.totalEnrolled} Enroll Course",
            ),
            propertiesBox(
              iconPath: "duration.png",
              title:
                  "Course duration: ${controller.courseDetails.value!.course!.duration}",
            ),
            propertiesBox(
              iconPath: "course_clock.png",
              title: "Time ${controller.courseDetails.value!.course!.time}",
            ),
            propertiesBox(
              iconPath: "course_video.png",
              title:
                  "${controller.courseDetails.value!.course!.totalVideoLecture} Video Lecture",
            ),
            propertiesBox(
              iconPath: "pdf.png",
              title:
                  "${controller.courseDetails.value!.course!.totalPdf} Class Lecture PDF",
            ),
          ],
        );
      },
    );
  }

  Widget propertiesBox({
    required String iconPath,
    required String title,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Paths.iconPath + iconPath,
            height: 20.h,
            width: 20.w,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 7.w),
          TextStyles.customText(
            title: title,
            fontSize: 14.sp,
          )
        ],
      ),
    );
  }
}
