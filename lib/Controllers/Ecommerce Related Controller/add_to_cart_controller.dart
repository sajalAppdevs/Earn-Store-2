import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/user_cart_controller.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  Map<dynamic, dynamic> body = {};
  RxBool addToCartLoading = false.obs;
  PostNetworks postNetworks = PostNetworks();
  UserCartController userCartController = Get.put(UserCartController());
  Future<void> addToCart({
    required String productID,
    required String productPrice,
  }) async {
    addToCartLoading.value = true;
    int userID = await LocalStorage.getUserID();
    if (userCartController.carts.value!.client!.cartInfo!.isEmpty) {
      body = {
        "product_id": productID,
        "user_id": userID.toString(),
        "product_price": productPrice,
      };
    } else {
      body = {
        "product_id": productID,
        "order_id": userCartController.carts.value!.client!.cartInfo![0].orderId
            .toString(),
        "user_id": userID.toString(),
        "product_price": productPrice,
      };
    }
    final response = await postNetworks.postDataWithoutResponse(
      url: "/addToCart",
      body: body,
    );
    response.fold(
      (left) {
        addToCartLoading.value = false;
        Snackbars.unSuccessSnackBar(
            title: "Add To Cart Status",
            description: "Failed to add product im cart");
      },
      (status) async {
        if (status == 200) {
          addToCartLoading.value = false;
          Snackbars.successSnackBar(
              title: "Add To Cart Status",
              description: "Product added to cart");
          await userCartController.geUserCart();
        } else {
          addToCartLoading.value = false;
          Snackbars.unSuccessSnackBar(
              title: "Add To Cart Status",
              description: "Failed to add product im cart");
        }
      },
    );
  }
}
