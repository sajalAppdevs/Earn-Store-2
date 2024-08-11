import 'package:earn_store/Models/Food%20Related%20Models/restaurant_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class RestaurantController extends GetxController {
  RxBool restaurantLoading = true.obs;
  final restaurants = Rxn<RestaurantModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getRestaurant() async {
    restaurantLoading.value = true;
    final response = await getNetworks.getData<RestaurantModel>(
      url: "/get-restaurants",
      fromJson: (json) => RestaurantModel.fromJson(json),
    );
    response.fold(
      (left) {
        restaurantLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Restaurant Status",
          description: left,
        );
      },
      (restaurantData) async {
        restaurants.value = restaurantData;
        restaurantLoading.value = false;
      },
    );
  }
}
