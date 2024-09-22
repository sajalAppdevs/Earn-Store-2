import 'package:earn_store/Models/Home%20Models/popular_course_details_model.dart';
import 'package:earn_store/Models/Home%20Models/popular_courses_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class PopularCoursesController extends GetxController {
  RxBool courseLoading = true.obs;
  RxBool courseDetailsLoading = true.obs;
  RxBool courseEnrollLoading = false.obs;
  final courses = Rxn<PopularCoursesModel>();
  final courseDetails = Rxn<PopularCourseDetailsModel>();
  GetNetworks getNetworks = GetNetworks();
  PostNetworks postNetworks = PostNetworks();
  Future<void> getPopularCourses() async {
    courseLoading.value = true;
    final response = await getNetworks.getData<PopularCoursesModel>(
      url: "/get-course",
      fromJson: (json) => PopularCoursesModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Course Status",
          description: left,
        );
        courseLoading.value = false;
      },
      (courseData) async {
        courses.value = courseData;
        courseLoading.value = false;
      },
    );
  }

  Future<void> getCourseDetails({
    required String courseID,
  }) async {
    courseDetailsLoading.value = true;
    final response = await getNetworks.getData<PopularCourseDetailsModel>(
      url: "/get-course-details?course_id=$courseID",
      fromJson: (json) => PopularCourseDetailsModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Course Details Status",
          description: left,
        );
        courseDetailsLoading.value = false;
      },
      (courseData) async {
        courseDetails.value = courseData;
        courseDetailsLoading.value = false;
      },
    );
  }

  Future<void> enrollCourse({
    required String courseID,
  }) async {
    courseEnrollLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postDataWithoutResponse(
      url: "/add-course-order",
      body: {
        "user_id": userID.toString(),
        "course_id": courseID,
      },
    );
    response.fold(
      (left) {
        courseEnrollLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Course Enroll Status",
          description: "Failed to enroll on this course.",
        );
      },
      (status) async {
        if (status == 200) {
          courseEnrollLoading.value = false;
          Snackbars.successSnackBar(
            title: "Course Enroll Status",
            description: "Enrolled on this course",
          );
        } else {
          courseEnrollLoading.value = false;
          Snackbars.unSuccessSnackBar(
            title: "Course Enroll Status",
            description: "Failed to enroll on this course.",
          );
        }
      },
    );
  }
}
