import 'package:earn_store/Models/Car%20Related%20Models/car_shop_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class CarShopController extends GetxController {
  RxBool carShopLoading = true.obs;
  final carShops = Rxn<CarShopModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getCarShop() async {
    carShopLoading.value = true;
    final response = await getNetworks.getData<CarShopModel>(
      url: "/get-car-shop",
      fromJson: (json) => CarShopModel.fromJson(json),
    );
    response.fold(
      (left) {
        carShopLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Car Shop Status",
          description: left,
        );
      },
      (carShopData) async {
        carShops.value = carShopData;
        carShopLoading.value = false;
      },
    );
  }
}
