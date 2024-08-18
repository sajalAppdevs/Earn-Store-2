import 'package:earn_store/Models/User%20Models/withdraw_history_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class WithdrawHistoryController extends GetxController {
  RxBool historyLoading = true.obs;
  final withdrawHistory = Rxn<WithdrawHistoryModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getWithdrawHistory() async {
    historyLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await getNetworks.getData<WithdrawHistoryModel>(
      url: "/withdraw?userid=$userID",
      fromJson: (json) => WithdrawHistoryModel.fromJson(json),
    );
    response.fold(
      (left) {
        historyLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Withdraw History Status",
          description: left,
        );
      },
      (history) async {
        withdrawHistory.value = history;
        historyLoading.value = false;
      },
    );
  }
}
