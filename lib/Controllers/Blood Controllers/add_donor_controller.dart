import 'package:earn_store/Controllers/Blood%20Controllers/blood_group_controller.dart';
import 'package:earn_store/Controllers/Blood%20Controllers/district_controller.dart';
import 'package:earn_store/Controllers/Blood%20Controllers/division_controller.dart';
import 'package:earn_store/Controllers/Blood%20Controllers/upazila_controller.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:get/get.dart';

class AddDonorController extends GetxController {
  RxBool addDonorLoading = false.obs;
  PostNetworks postNetworks = PostNetworks();
  DivisionController divisionController = Get.put(DivisionController());
  DistrictController districtController = Get.put(DistrictController());
  UpazilaController upazilaController = Get.put(UpazilaController());
  BloodGroupController bloodGroupController = Get.put(BloodGroupController());
  Future<void> addDonor({
    required String name,
    required String mobile,
    required String lastDonorDate,
  }) async {
    addDonorLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postDataWithoutResponse(
      url: "/add-donor",
      body: {
        "name": name,
        "mobile_number": mobile,
        "upazila_id": upazilaController.upazilaID.value.toString(),
        "district_id": districtController.districtID.value.toString(),
        "division_id": divisionController.divisionID.value.toString(),
        "user_id": userID.toString(),
      },
    );
    response.fold(
      (left) {
        addDonorLoading.value = false;
        Snackbars.unSuccessSnackBar(
            title: "Add Donor Status", description: "Failed to add donor");
      },
      (status) async {
        if (status == 200) {
          addDonorLoading.value = false;
          Snackbars.successSnackBar(
              title: "Add Donor Status", description: "Donor Added");
          Get.offAll(
            const RootScreen(),
          );
        } else {
          addDonorLoading.value = false;
          Snackbars.unSuccessSnackBar(
            title: "Add Donor Status",
            description: "Failed to add donor",
          );
        }
      },
    );
  }
}
