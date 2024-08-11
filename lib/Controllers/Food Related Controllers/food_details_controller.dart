import 'package:earn_store/Models/Food%20Related%20Models/food_details_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class FoodDetailsController extends GetxController {
  RxBool foodLoading = true.obs;
  final foodDetails = Rxn<FoodDetailsModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getFoodDetails({required String foodID}) async {
    foodLoading.value = true;
    final response = await getNetworks.getData<FoodDetailsModel>(
      url: "/get-food-by-id?food_id=$foodID",
      fromJson: (json) => FoodDetailsModel.fromJson(json),
    );
    response.fold(
      (left) {
        foodLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Food Status",
          description: left,
        );
      },
      (foodsData) async {
        foodDetails.value = foodsData;
        foodLoading.value = false;
      },
    );
  }
}
