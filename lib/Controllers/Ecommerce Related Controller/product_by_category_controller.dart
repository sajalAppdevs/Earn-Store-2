import 'package:earn_store/Models/Ecommerce%20Models/product_by_category_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class ProductByCategoryController extends GetxController {
  RxBool productLoading = true.obs;
  final productsByCategory = Rxn<ProductByCategoryModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getProductByCategory({
    required String categoryID,
  }) async {
    productLoading.value = true;
    final response = await getNetworks.getData<ProductByCategoryModel>(
      url: "/productsByCat?catID=$categoryID",
      fromJson: (json) => ProductByCategoryModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Product By Category Status",
          description: left,
        );
        productLoading.value = false;
      },
      (productData) async {
        productsByCategory.value = productData;
        productLoading.value = false;
      },
    );
  }
}
