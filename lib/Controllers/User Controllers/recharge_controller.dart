import 'package:earn_store/Controllers/User%20Controllers/operator_controller.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:get/get.dart';

class RechargeController extends GetxController {
  RxBool rechargeLoading = false.obs;
  PostNetworks postNetworks = PostNetworks();
  OperatorController operatorController = Get.put(
    OperatorController(),
  );
  Future<void> recharge({
    required String number,
    required String amount,
  }) async {
    rechargeLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postDataWithoutResponse(
      url: "/add-recharge?userid=$userID",
      body: {
        "number": number,
        "operator": operatorController.operatorID.toString(),
        "amount": amount,
      },
    );
    response.fold(
      (left) {
        rechargeLoading.value = false;
        Snackbars.unSuccessSnackBar(
            title: "Money Recharge Status",
            description: "Failed to recharge money");
      },
      (status) async {
        if (status == 200) {
          rechargeLoading.value = false;
          Snackbars.successSnackBar(
              title: "Money recharge Status", description: "Sended to admin");
          Get.offAll(
            const RootScreen(),
          );
        } else {
          rechargeLoading.value = false;
          Snackbars.unSuccessSnackBar(
              title: "Money recharge Status",
              description: "Failed to recharge money");
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
