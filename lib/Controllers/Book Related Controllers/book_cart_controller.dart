import 'package:earn_store/Models/Book%20Related%20Models/book_cart_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class BookCartController extends GetxController {
  RxInt loadingIndex = 0.obs;
  RxBool cartLoading = true.obs;
  RxBool updateCartLoading = false.obs;
  RxInt subTotal = 0.obs;
  final carts = Rxn<BookCartModel>();
  GetNetworks getNetworks = GetNetworks();
  PostNetworks postNetworks = PostNetworks();
  Future<void> getBookCart() async {
    cartLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await getNetworks.getData<BookCartModel>(
      url: "/book-getCart?user_id=$userID",
      fromJson: (json) => BookCartModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Book Cart Status",
          description: left,
        );
        cartLoading.value = false;
      },
      (cartData) async {
        carts.value = cartData;
        cartBottomInfo();
        cartLoading.value = false;
      },
    );
  }

  void incrementQuantity({required int index}) async {
    loadingIndex.value = index;
    String orderDetailsID =
        carts.value!.client!.cartInfo![index].orderDetailsId.toString();
    int quantity =
        carts.value!.client!.cartInfo![index].productQuantity!.toInt();
    int productPrice = carts.value!.client!.cartInfo![index].bookPrice!.toInt();
    int tempQuantity = quantity + 1;
    int tempPrice = tempQuantity * productPrice;
    await updateCart(
      orderDetailsID: orderDetailsID,
      quantity: tempQuantity.toString(),
      price: tempPrice.toString(),
    );
    await getBookCart();
  }

  void decrementQuantity({required int index}) async {
    loadingIndex.value = index;
    String orderDetailsID =
        carts.value!.client!.cartInfo![index].orderDetailsId.toString();
    int quantity =
        carts.value!.client!.cartInfo![index].productQuantity!.toInt();
    int productPrice = carts.value!.client!.cartInfo![index].bookPrice!.toInt();
    int tempQuantity = quantity - 1;
    int tempPrice = tempQuantity * productPrice;
    if (tempQuantity > 0) {
      await updateCart(
        orderDetailsID: orderDetailsID,
        quantity: tempQuantity.toString(),
        price: tempPrice.toString(),
      );
      await getBookCart();
    }
  }

  void cartBottomInfo() {
    int total = 0;
    for (var element in carts.value!.client!.cartInfo!) {
      total = total + element.productTotalPrice!.toInt();
    }
    subTotal.value = total;
  }

  Future<void> updateCart({
    required String orderDetailsID,
    required String quantity,
    required String price,
  }) async {
    updateCartLoading.value = true;
    final response = await postNetworks.postDataWithoutResponse(
      url: "/book-update_cart",
      body: {
        "order_details_id": orderDetailsID,
        "product_quantity": quantity,
        "product_total_price": price,
      },
    );
    response.fold(
      (left) {
        updateCartLoading.value = false;
        Snackbars.unSuccessSnackBar(
            title: "Update Cart Status",
            description: "Failed to update book in cart");
      },
      (status) async {
        if (status == 200) {
          updateCartLoading.value = false;
        } else {
          updateCartLoading.value = false;
        }
      },
    );
  }
}
