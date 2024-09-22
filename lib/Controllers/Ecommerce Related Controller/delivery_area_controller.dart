import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/user_cart_controller.dart';
import 'package:earn_store/Models/Ecommerce%20Models/delivery_area_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class DeliveryAreaController extends GetxController {
  RxBool areaLoading = true.obs;
  RxInt areaID = 0.obs;
  RxString hintText = "Select Delivery Area".obs;
  final deliveryAreas = Rxn<DeliveryAreaModel>();
  GetNetworks getNetworks = GetNetworks();
  UserCartController userCartController = Get.put(
    UserCartController(),
  );
  Future<void> getDeliveryArea() async {
    areaLoading.value = true;
    final response = await getNetworks.getData<DeliveryAreaModel>(
      url: "/deliveryCharge",
      fromJson: (json) => DeliveryAreaModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Delivery Area Status",
          description: left,
        );
        areaLoading.value = false;
      },
      (areaData) async {
        deliveryAreas.value = areaData;
        areaLoading.value = false;
      },
    );
  }

  void setDeliveryArea({required int value}) {
    areaID.value = value;
    for (var element in deliveryAreas.value!.charge!) {
      if (element.deliveryId == areaID.value) {
        hintText.value = element.location.toString();
        userCartController.setDeliveryCharge(
          charge: element.charge!.toInt(),
        );
      }
    }
  }

  void setDeliveryEmpty() {
    areaID.value = 0;
    userCartController.setDeliveryCharge(charge: 0);
    hintText.value = "Select Delivery Area";
  }
}
