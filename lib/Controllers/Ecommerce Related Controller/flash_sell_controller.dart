import 'package:earn_store/Models/Ecommerce%20Models/flash_sell_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class FlashSellController extends GetxController {
  RxBool flashLoading = true.obs;
  final flashSells = Rxn<FlashSellModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getFlashSells() async {
    flashLoading.value = true;
    final response = await getNetworks.getData<FlashSellModel>(
      url: "/flashSell",
      fromJson: (json) => FlashSellModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Flash Sell Status",
          description: left,
        );
        flashLoading.value = false;
      },
      (flashSellData) async {
        flashSells.value = flashSellData;
        flashLoading.value = false;
      },
    );
  }
}
