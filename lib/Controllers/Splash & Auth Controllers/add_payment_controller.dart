import 'package:earn_store/Controllers/Splash%20&%20Auth%20Controllers/register_controller.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class AddPaymentController extends GetxController {
  RxBool addPaymentLoading = false.obs;
  PostNetworks postNetworks = PostNetworks();
  RegisterController registerController = Get.put(RegisterController());
  Future<void> addPayment({
    required String amount,
    required String packageID,
  }) async {
    addPaymentLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postDataWithoutResponse(
      url: "/add-payment?user_id=$userID",
      body: {
        "mobile_number": "01XXXXXXXX",
        "operator": "Nagad",
        "transaction_id": "Not Defined",
        "amount": amount,
        "package_id": packageID,
      },
    );
    response.fold(
      (left) {
        addPaymentLoading.value = false;
        Snackbars.unSuccessSnackBar(
            title: "Add Payment Status", description: "Failed to add payment");
      },
      (status) async {
        if (status == 200) {
          addPaymentLoading.value = false;
          Snackbars.successSnackBar(
            title: "Add Payment Status",
            description: "Sended to admin fro verification",
          );
        } else {
          addPaymentLoading.value = false;
          Snackbars.unSuccessSnackBar(
              title: "Add Payment Status",
              description: "Failed to add payment");
        }
      },
    );
  }
}
