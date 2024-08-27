import 'package:earn_store/Models/Blood%20Group%20Models/division_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class DivisionController extends GetxController {
  RxBool divisionLoading = true.obs;
  RxString divisionText = "Choose Division".obs;
  RxInt divisionID = 0.obs;
  final divisions = Rxn<DivisionModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getDivision() async {
    divisionLoading.value = true;
    final response = await getNetworks.getData<DivisionModel>(
      url: "/get-division",
      fromJson: (json) => DivisionModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Division Status",
          description: left,
        );
        divisionLoading.value = false;
      },
      (divisionData) async {
        divisions.value = divisionData;
        divisionLoading.value = false;
      },
    );
  }
}
