import 'package:earn_store/Models/Blood%20Group%20Models/all_blood_group_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class BloodGroupController extends GetxController {
  RxBool isBloodLoading = true.obs;
  RxInt bloodGroupID = 0.obs;
  RxString bloodText = "Choose".obs;
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

  void setBloodGroup({required int value}) {
    bloodGroupID.value = value;
    for (var element in bloodGroups.value!.bloodGroups!) {
      if (element.id == bloodGroupID.value) {
        bloodText.value = element.bloodGroup.toString();
      }
    }
  }
}
