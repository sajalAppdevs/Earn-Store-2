import 'package:earn_store/Models/Blood%20Group%20Models/recent_donation_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class RecentDonationController extends GetxController {
  RxBool donationLoading = true.obs;
  final recentDonations = Rxn<RecentDonationModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getRecentDonation() async {
    donationLoading.value = true;
    final response = await getNetworks.getData<RecentDonationModel>(
      url: "/get-recent-donation",
      fromJson: (json) => RecentDonationModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Donation Status",
          description: left,
        );
        donationLoading.value = false;
      },
      (donationData) async {
        recentDonations.value = donationData;
        donationLoading.value = false;
      },
    );
  }
}
