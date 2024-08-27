import 'package:earn_store/Controllers/Home%20Controllers/popular_courses_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Pages/Feed%20Pages/feed_video_details.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularContentPreview extends StatelessWidget {
  const PopularContentPreview({super.key});

  @override
  Widget build(BuildContext context) {
    PopularCoursesController controller = Get.put(
      PopularCoursesController(),
    );
    return Obx(
      () {
        return controller.courseDetails.value!.courseVideo!.isEmpty
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStyles.customText(
                    title: "Content Preview",
                    fontSize: 14.sp,
                  ),
                  SizedBox(height: 15.h),
                  ListView.builder(
                    itemCount:
                        controller.courseDetails.value!.courseVideo!.length,
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
          child: GestureDetector(
            onTap: () {
              Get.to(
                FeedVideoDetails(
                  videoUrl: controller
                      .courseDetails.value!.courseVideo![index].video
                      .toString(),
                ),
              );
            },
            child: Row(
              children: [
                Image.asset(
                  "${Paths.iconPath}video.png",
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 10.w),
                SizedBox(
                  width: 300.w,
                  child: TextStyles.customText(
                    title:
                        "Video: ${controller.courseDetails.value!.courseVideo![index].title}",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    isShowAll: true,
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
