import 'package:earn_store/Models/User%20Models/payment_method_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  RxString operatorName = "".obs;
  RxInt withdrawMethodIndex = 0.obs;
  RxBool methodsLoading = true.obs;
  final methods = Rxn<PaymentMethodsModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getPaymentMethods() async {
    methodsLoading.value = true;
    final response = await getNetworks.getData<PaymentMethodsModel>(
      url: "/get-payment-method",
      fromJson: (json) => PaymentMethodsModel.fromJson(json),
    );
    response.fold(
      (left) {
        methodsLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Payment Method Status",
          description: left,
        );
      },
      (methodsData) async {
        methods.value = methodsData;
        operatorName.value = methods.value!.paymentMethods![0].title.toString();
        methodsLoading.value = false;
      },
    );
  }

  void withdrawMethodChange({required int index}) {
    withdrawMethodIndex.value = index;
    operatorName.value = methods.value!.paymentMethods![index].title.toString();
  }
}
