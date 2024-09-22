import 'package:earn_store/Models/Home%20Models/all_agency_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class AllAgencyController extends GetxController {
  RxBool agencyLoading = true.obs;
  final agencies = Rxn<AllAgencyModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getAllAgencies() async {
    agencyLoading.value = true;
    final response = await getNetworks.getData<AllAgencyModel>(
      url: "/get-hajj-agencys",
      fromJson: (json) => AllAgencyModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Agency Status",
          description: left,
        );
        agencyLoading.value = false;
      },
      (agencyData) async {
        agencies.value = agencyData;
        agencyLoading.value = false;
      },
    );
  }
}
