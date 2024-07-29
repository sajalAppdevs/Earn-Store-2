import 'package:earn_store/Models/Home%20Models/online_course_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class OnlineCourseController extends GetxController {
  RxBool courseLoading = true.obs;
  final courses = Rxn<OnlineCourseModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> geOnlineCourse() async {
    courseLoading.value = true;
    final response = await getNetworks.getData<OnlineCourseModel>(
      url: "/get-online-course",
      fromJson: (json) => OnlineCourseModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Online Course Status",
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
