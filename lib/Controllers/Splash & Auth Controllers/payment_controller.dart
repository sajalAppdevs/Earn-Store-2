import 'package:get/get.dart';

class PaymentController extends GetxController {
  RxInt methodIndex = 0.obs;

  void changeMethodIndex({required int index}) {
    methodIndex.value = index;
  }
}
