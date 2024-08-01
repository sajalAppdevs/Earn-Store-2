import 'package:earn_store/Models/Home%20Models/help_center_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class HelpCenterController extends GetxController {
  final helpCenters = Rxn<HelpCenterModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getHelpCenter() async {
    final response = await getNetworks.getData<HelpCenterModel>(
      url: "/get-help-center",
      fromJson: (json) => HelpCenterModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Help Center Status",
          description: left,
        );
      },
      (helpCenterData) async {
        helpCenters.value = helpCenterData;
      },
    );
  }
}
