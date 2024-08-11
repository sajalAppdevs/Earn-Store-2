import 'package:earn_store/Models/Car%20Related%20Models/car_details_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class CarDetailsController extends GetxController {
  RxBool carDetailsLoading = true.obs;
  final carDetails = Rxn<CarDetailsModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getCarDetails({required String carID}) async {
    carDetailsLoading.value = true;
    final response = await getNetworks.getData<CarDetailsModel>(
      url: "/get-car-by-id?car_id=$carID",
      fromJson: (json) => CarDetailsModel.fromJson(json),
    );
    response.fold(
      (left) {
        carDetailsLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Car Details Status",
          description: left,
        );
      },
      (carDetailsData) async {
        carDetails.value = carDetailsData;
        carDetailsLoading.value = false;
      },
    );
  }
}
