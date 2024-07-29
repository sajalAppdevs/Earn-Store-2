import 'package:earn_store/Models/Home%20Models/sport_update_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class SportUpdateController extends GetxController {
  RxBool sportLoading = true.obs;
  final sportUpdates = Rxn<SportUpdateModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getSportUpdates() async {
    sportLoading.value = true;
    final response = await getNetworks.getData<SportUpdateModel>(
      url: "/get-sport-updates",
      fromJson: (json) => SportUpdateModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Sport Status",
          description: left,
        );
        sportLoading.value = false;
      },
      (hotelData) async {
        sportUpdates.value = hotelData;
        sportLoading.value = false;
      },
    );
  }
}
