import 'package:earn_store/Controllers/Home%20Controllers/popular_courses_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/popular_content_preview.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/popular_course_content.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/popular_course_content_details.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/popular_course_details_top.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/popular_course_instructor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularCourseDetails extends StatefulWidget {
  final String courseID;
  const PopularCourseDetails({
    super.key,
    required this.courseID,
  });

  @override
  State<PopularCourseDetails> createState() => _PopularCourseDetailsState();
}

class _PopularCourseDetailsState extends State<PopularCourseDetails> {
  PopularCoursesController controller = Get.put(
    PopularCoursesController(),
  );
  @override
  void initState() {
    super.initState();
    debugPrint(widget.courseID);
    getData();
  }

  void getData() async {
    await controller.getCourseDetails(courseID: widget.courseID);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.courseDetailsLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CustomTop(
                      title: "Course Details",
                    ),
                    PaddedScreen(
                      padding: 15.sp,
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          const PopularCourseDetailsTop(),
                          SizedBox(height: 20.h),
                          const PopularCourseInstructor(),
                          SizedBox(height: 20.h),
                          const PopularCourseContent(),
                          SizedBox(height: 20.h),
                          const PopularCourseContentDetails(),
                          SizedBox(height: 20.h),
                          const PopularContentPreview(),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
