import 'package:earn_store/Controllers/Book%20Related%20Controllers/book_cart_controller.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class BookAddToCartController extends GetxController {
  Map<dynamic, dynamic> body = {};
  RxBool addToCartLoading = false.obs;
  PostNetworks postNetworks = PostNetworks();
  BookCartController bookCartController = Get.put(BookCartController());
  Future<void> addToCart({
    required String bookID,
    required String bookPrice,
  }) async {
    addToCartLoading.value = true;
    int userID = await LocalStorage.getUserID();
    if (bookCartController.carts.value!.client!.cartInfo!.isEmpty) {
      body = {
        "book_id": bookID,
        "user_id": userID.toString(),
        "book_price": bookPrice,
      };
    } else {
      body = {
        "book_id": bookID,
        "order_id": bookCartController.carts.value!.client!.cartInfo![0].orderId
            .toString(),
        "user_id": userID.toString(),
        "book_price": bookPrice,
      };
    }
    final response = await postNetworks.postDataWithoutResponse(
      url: "/book-addToCart",
      body: body,
    );
    response.fold(
      (left) {
        addToCartLoading.value = false;
        Snackbars.unSuccessSnackBar(
            title: "Add To Cart Status",
            description: "Failed to add book in cart");
      },
      (status) async {
        if (status == 200) {
          addToCartLoading.value = false;
          Snackbars.successSnackBar(
              title: "Add To Cart Status", description: "Book added to cart");
          await bookCartController.getBookCart();
        } else {
          addToCartLoading.value = false;
          Snackbars.unSuccessSnackBar(
              title: "Add To Cart Status",
              description: "Failed to add book in cart");
        }
      },
    );
  }
}
