import 'package:earn_store/Controllers/User%20Controllers/payment_method_controller.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:get/get.dart';

class WithdrawController extends GetxController {
  RxBool withdrawLoading = false.obs;
  PostNetworks postNetworks = PostNetworks();
  PaymentMethodController paymentMethodController = Get.put(
    PaymentMethodController(),
  );
  Future<void> withdraw({
    required String number,
    required String amount,
  }) async {
    withdrawLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postDataWithoutResponse(
      url: "/add-withdraw?userid=$userID",
      body: {
        "number": number,
        "operator": paymentMethodController.operatorName.toString(),
        "amount": amount,
      },
    );
    response.fold(
      (left) {
        withdrawLoading.value = false;
        Snackbars.unSuccessSnackBar(
            title: "Money Withdraw Status",
            description: "Failed to withdraw money");
      },
      (status) async {
        if (status == 200) {
          withdrawLoading.value = false;
          Snackbars.successSnackBar(
              title: "Money Withdraw Status", description: "Sended to admin");
          Get.offAll(
            const RootScreen(),
          );
        } else {
          withdrawLoading.value = false;
          Snackbars.unSuccessSnackBar(
              title: "Money Withdraw Status",
              description: "Failed to withdraw money");
        }
      },
    );
  }

  bool availableChecker({
    required String requestedAmount,
    required String balance,
  }) {
    try {
      int int1 = int.parse(requestedAmount);
      int int2 = int.parse(balance);
      return int2 > int1;
    } catch (e) {
      return false;
    }
  }
}
