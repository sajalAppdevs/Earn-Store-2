import 'package:get/get.dart';

class HomeAdvertiseController extends GetxController {
  RxInt sliderIndex = 0.obs;
  RxInt sliderLength = 5.obs;

  void setSliderIndex({required int value}) {
    sliderIndex.value = value;
  }
}