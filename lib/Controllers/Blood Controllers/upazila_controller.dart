import 'package:earn_store/Models/Blood%20Group%20Models/upazila_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class UpazilaController extends GetxController {
  RxBool upazilaLoading = false.obs;
  RxString upazilaText = "Choose Upazila".obs;
  RxInt upazilaID = 0.obs;
  final upazila = Rxn<UpazilaModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getUpazila({required String districtID}) async {
    upazilaLoading.value = true;
    final response = await getNetworks.getData<UpazilaModel>(
      url: "/get-upazila?district_id=$districtID",
      fromJson: (json) => UpazilaModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Upazila Status",
          description: left,
        );
        upazilaLoading.value = false;
      },
      (upazilaData) async {
        upazila.value = upazilaData;
        upazilaLoading.value = false;
      },
    );
  }

  void setUpazila({required int value}) {
    upazilaID.value = value;
    for (var element in upazila.value!.upazilas!) {
      if (element.id == upazilaID.value) {
        upazilaText.value = element.name.toString();
      }
    }
  }

  void setUpazilaEmpty() {
    upazilaID.value = 0;
    upazilaText.value = "Choose Upazila";
  }
}
