import 'package:get/get.dart';

class CartController extends GetxController {
  RxBool selectAll = false.obs;

  void changeSelectAll() {
    selectAll.value = !selectAll.value;
  }
}
