import 'package:earn_store/Models/Auth%20Models/package_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class AllPackageController extends GetxController {
  RxBool packageLoading = true.obs;
  final packages = Rxn<AllPackageModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getPackages() async {
    packageLoading.value = true;
    final response = await getNetworks.getData<AllPackageModel>(
      url: "/get-packages",
      fromJson: (json) => AllPackageModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Package Status",
          description: left,
        );
        packageLoading.value = false;
      },
      (packageData) async {
        packages.value = packageData;
        packageLoading.value = false;
      },
    );
  }
}
