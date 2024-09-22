import 'package:earn_store/Models/Ecommerce%20Models/all_product_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController {
  RxBool productLoading = true.obs;
  final allProducts = Rxn<AllProductModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getAllProducts() async {
    productLoading.value = true;
    final response = await getNetworks.getData<AllProductModel>(
      url: "/allProducts",
      fromJson: (json) => AllProductModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "All Products Status",
          description: left,
        );
        productLoading.value = false;
      },
      (productsData) async {
        allProducts.value = productsData;
        productLoading.value = false;
      },
    );
  }
}
