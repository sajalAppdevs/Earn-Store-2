import 'package:get/get.dart';

class WithdrawController extends GetxController {
  RxInt withdrawMethodIndex = 0.obs;

  void withdrawMethodChange({required int index}) {
    withdrawMethodIndex.value = index;
  }
}
