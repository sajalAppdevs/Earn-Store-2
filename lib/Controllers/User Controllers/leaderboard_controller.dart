import 'package:earn_store/Models/User%20Models/leaderboard_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class LeaderboardController extends GetxController {
  RxBool leaderboardLoading = true.obs;
  final leaderboard = Rxn<LeaderboardModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getLeaderboard() async {
    leaderboardLoading.value = true;
    final response = await getNetworks.getData<LeaderboardModel>(
      url: "/get-leaderboard",
      fromJson: (json) => LeaderboardModel.fromJson(json),
    );
    response.fold(
      (left) {
        leaderboardLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Leaderboard Status",
          description: left,
        );
      },
      (leaderboardInfo) async {
        leaderboard.value = leaderboardInfo;
        leaderboardLoading.value = false;
      },
    );
  }
}
