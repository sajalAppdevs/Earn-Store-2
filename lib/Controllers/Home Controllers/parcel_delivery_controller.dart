import 'package:earn_store/Models/Home%20Models/parcel_delivery_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class ParcelDeliveryController extends GetxController {
  RxBool parcelLoading = true.obs;
  final parcels = Rxn<ParcelDeliveryModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getAllParcelDelivery() async {
    parcelLoading.value = true;
    final response = await getNetworks.getData<ParcelDeliveryModel>(
      url: "/get-delivery-company",
      fromJson: (json) => ParcelDeliveryModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Parcel Status",
          description: left,
        );
        parcelLoading.value = false;
      },
      (parcelData) async {
        parcels.value = parcelData;
        parcelLoading.value = false;
      },
    );
  }
}
