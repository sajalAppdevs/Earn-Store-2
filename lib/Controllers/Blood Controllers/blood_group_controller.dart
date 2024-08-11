import 'package:earn_store/Models/Blood%20Group%20Models/all_blood_group_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class BloodGroupController extends GetxController {
  RxBool isBloodLoading = true.obs;
  final bloodGroups = Rxn<BloodGroupModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getAllBloodGroup() async {
    isBloodLoading.value = true;
    final response = await getNetworks.getData<BloodGroupModel>(
      url: "/get-blood-group",
      fromJson: (json) => BloodGroupModel.fromJson(json),
    );
    response.fold(
      (left) {
        isBloodLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Blood Group Status",
          description: left,
        );
      },
      (bloodGroupData) async {
        bloodGroups.value = bloodGroupData;
        isBloodLoading.value = false;
      },
    );
  }
}
