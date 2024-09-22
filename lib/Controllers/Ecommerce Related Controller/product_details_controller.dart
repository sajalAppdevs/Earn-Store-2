import 'package:earn_store/Models/Ecommerce%20Models/product_details_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  RxBool productLoading = true.obs;
  final productDetails = Rxn<ProductDetailsModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getProductDetails({
    required String productID,
  }) async {
    productLoading.value = true;
    final response = await getNetworks.getData<ProductDetailsModel>(
      url: "/productDetails?id=$productID",
      fromJson: (json) => ProductDetailsModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Product Details Status",
          description: left,
        );
        productLoading.value = false;
      },
      (productData) async {
        productDetails.value = productData;
        productLoading.value = false;
      },
    );
  }
}
