import 'package:earn_store/Models/Home%20Models/tour_agency_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class TourAgencyController extends GetxController {
  RxBool agenciesLoading = true.obs;
  final allAgencies = Rxn<TourAgencyModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getAllAgencies() async {
    agenciesLoading.value = true;
    final response = await getNetworks.getData<TourAgencyModel>(
      url: "/get-agencys",
      fromJson: (json) => TourAgencyModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Agency Status",
          description: left,
        );
        agenciesLoading.value = false;
      },
      (tourPackages) async {
        allAgencies.value = tourPackages;
        agenciesLoading.value = false;
      },
    );
  }
}
