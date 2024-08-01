import 'package:earn_store/Models/Social%20Media%20Models/live_tv_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class LiveTVController extends GetxController {
  final liveTvs = Rxn<LiveTVModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getOnlineTV() async {
    final response = await getNetworks.getData<LiveTVModel>(
      url: "/get-online-tv",
      fromJson: (json) => LiveTVModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Online Tv Status",
          description: left,
        );
      },
      (onlineTVData) async {
        liveTvs.value = onlineTVData;
      },
    );
  }
}
