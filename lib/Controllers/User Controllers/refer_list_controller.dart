import 'package:earn_store/Models/User%20Models/refer_list_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class ReferListController extends GetxController {
  RxBool referLoading = true.obs;
  final refers = Rxn<ReferListModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getReferList() async {
    referLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await getNetworks.getData<ReferListModel>(
      url: "/get-refers?userId=$userID",
      fromJson: (json) => ReferListModel.fromJson(json),
    );
    response.fold(
      (left) {
        referLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Refer Status",
          description: left,
        );
      },
      (referInfo) async {
        refers.value = referInfo;
        referLoading.value = false;
      },
    );
  }
}
