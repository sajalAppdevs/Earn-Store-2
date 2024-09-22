import 'package:earn_store/Models/Ecommerce%20Models/user_cart_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCartController extends GetxController {
  RxInt loadingIndex = 0.obs;
  RxBool cartLoading = true.obs;
  RxBool updateCartLoading = false.obs;
  RxInt subTotal = 0.obs;
  RxInt deliveryCharge = 0.obs;
  final carts = Rxn<UserCartModel>();
  GetNetworks getNetworks = GetNetworks();
  PostNetworks postNetworks = PostNetworks();
  Future<void> geUserCart() async {
    cartLoading.value = true;
    int userID = await LocalStorage.getUserID();
    debugPrint(userID.toString());
    final response = await getNetworks.getData<UserCartModel>(
      url: "/getCart?user_id=$userID",
      fromJson: (json) => UserCartModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "User Cart Status",
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
    int productPrice =
        carts.value!.client!.cartInfo![index].productPrice!.toInt();
    int tempQuantity = quantity + 1;
    int tempPrice = tempQuantity * productPrice;
    await updateCart(
      orderDetailsID: orderDetailsID,
      quantity: tempQuantity.toString(),
      price: tempPrice.toString(),
    );
    await geUserCart();
  }

  void decrementQuantity({required int index}) async {
    loadingIndex.value = index;
    String orderDetailsID =
        carts.value!.client!.cartInfo![index].orderDetailsId.toString();
    int quantity =
        carts.value!.client!.cartInfo![index].productQuantity!.toInt();
    int productPrice =
        carts.value!.client!.cartInfo![index].productPrice!.toInt();
    int tempQuantity = quantity - 1;
    int tempPrice = tempQuantity * productPrice;
    if (tempQuantity > 0) {
      await updateCart(
        orderDetailsID: orderDetailsID,
        quantity: tempQuantity.toString(),
        price: tempPrice.toString(),
      );
      await geUserCart();
    }
  }

  void cartBottomInfo() {
    int total = 0;
    for (var element in carts.value!.client!.cartInfo!) {
      total = total + element.productTotalPrice!.toInt();
    }
    subTotal.value = total;
  }

  void setDeliveryCharge({required int charge}) {
    deliveryCharge.value = charge;
  }

  Future<void> updateCart({
    required String orderDetailsID,
    required String quantity,
    required String price,
  }) async {
    updateCartLoading.value = true;
    final response = await postNetworks.postDataWithoutResponse(
      url: "/update_cart",
      body: {
        "orderDetailsId": orderDetailsID,
        "quantity": quantity,
        "price": price,
      },
    );
    response.fold(
      (left) {
        updateCartLoading.value = false;
        Snackbars.unSuccessSnackBar(
            title: "Update Cart Status",
            description: "Failed to update product in cart");
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
