import 'package:earn_store/Models/Food%20Related%20Models/food_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  RxBool foodLoading = true.obs;
  final foods = Rxn<FoodModel>();
  final searchFood = Rxn<FoodModel>();
  FoodModel dummyData = FoodModel(
    data: [],
    status: true,
  );
  GetNetworks getNetworks = GetNetworks();
  Future<void> getFoods({required String restaurantID}) async {
    foodLoading.value = true;
    final response = await getNetworks.getData<FoodModel>(
      url: "/get-food-by-restaurants?res_id=$restaurantID",
      fromJson: (json) => FoodModel.fromJson(json),
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
        foods.value = foodsData;
        searchFood.value = foodsData;
        foodLoading.value = false;
      },
    );
  }

  void filterFood({required String value}) {
    if (value.isEmpty) {
      foods.value = searchFood.value;
    } else {
      dummyData.data = searchFood.value!.data!.where((element) {
        String foodName = element.name.toString().toLowerCase();

        return foodName.contains(value.toLowerCase());
      }).toList();
      foods.value = FoodModel(
        data: dummyData.data,
        status: true,
      );
    }
  }
}
