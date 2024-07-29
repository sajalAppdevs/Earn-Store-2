import 'package:earn_store/Models/Home%20Models/popular_courses_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class PopularCoursesController extends GetxController {
  RxBool courseLoading = true.obs;
  final courses = Rxn<PopularCoursesModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getPopularCourses() async {
    courseLoading.value = true;
    final response = await getNetworks.getData<PopularCoursesModel>(
      url: "/get-popular-course",
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
}
