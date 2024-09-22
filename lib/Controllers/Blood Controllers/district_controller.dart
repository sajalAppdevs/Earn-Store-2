import 'package:earn_store/Models/Blood%20Group%20Models/district_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class DistrictController extends GetxController {
  RxBool districtLoading = false.obs;
  RxString districtText = "Choose Zela".obs;
  RxInt districtID = 0.obs;
  final district = Rxn<DistrictModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getDistrict({required String divisionID}) async {
    districtLoading.value = true;
    final response = await getNetworks.getData<DistrictModel>(
      url: "/get-district?division_id=$divisionID",
      fromJson: (json) => DistrictModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "District Status",
          description: left,
        );
        districtLoading.value = false;
      },
      (districtData) async {
        district.value = districtData;
        districtLoading.value = false;
      },
    );
  }

  void setDistrict({required int value}) {
    districtID.value = value;
    for (var element in district.value!.districts!) {
      if (element.id == districtID.value) {
        districtText.value = element.name.toString();
      }
    }
  }

  void setDistrictEmpty() {
    districtID.value = 0;
    districtText.value = "Choose Zela";
  }
}
