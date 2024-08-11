import 'package:earn_store/Models/Car%20Related%20Models/car_by_shop_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class CarByShopController extends GetxController {
  RxBool carLoading = true.obs;
  final cars = Rxn<CarByShopModel>();
  final searchCars = Rxn<CarByShopModel>();
  CarByShopModel dummyData = CarByShopModel(
    data: [],
    status: true,
  );
  GetNetworks getNetworks = GetNetworks();
  Future<void> getCars({required String shopID}) async {
    carLoading.value = true;
    final response = await getNetworks.getData<CarByShopModel>(
      url: "/get-car-by-shop?shop_id=$shopID",
      fromJson: (json) => CarByShopModel.fromJson(json),
    );
    response.fold(
      (left) {
        carLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Car Status",
          description: left,
        );
      },
      (carShopData) async {
        cars.value = carShopData;
        searchCars.value = carShopData;
        carLoading.value = false;
      },
    );
  }

  void filterCar({required String value}) {
    if (value.isEmpty) {
      cars.value = searchCars.value;
    } else {
      dummyData.data = searchCars.value!.data!.where((element) {
        String carName = element.name.toString().toLowerCase();
        String seat = element.seat.toString().toLowerCase();
        return carName.contains(value.toLowerCase()) ||
            seat.contains(
              value.toLowerCase(),
            );
      }).toList();
      cars.value = CarByShopModel(
        data: dummyData.data,
        status: true,
      );
    }
  }
}
