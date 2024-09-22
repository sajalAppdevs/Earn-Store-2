import 'package:earn_store/Models/Ecommerce%20Models/all_category_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AllCategoryController extends GetxController {
  RxBool categoryLoading = true.obs;
  final categories = Rxn<AllCategoryModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getAllCategory() async {
    final response = await getNetworks.getData<AllCategoryModel>(
      url: "/allCategory",
      fromJson: (json) => AllCategoryModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "All Category Status",
          description: left,
        );
        categoryLoading.value = false;
        debugPrint(categoryLoading.value.toString());
      },
      (categoriesData) {
        categories.value = categoriesData;
        categoryLoading.value = false;
        debugPrint(categoryLoading.value.toString());
      },
    );
  }
}
