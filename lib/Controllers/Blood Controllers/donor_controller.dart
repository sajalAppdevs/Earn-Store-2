import 'package:earn_store/Models/Blood%20Group%20Models/donor_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class DonorController extends GetxController {
  RxBool isDonorLoading = true.obs;
  final donors = Rxn<DonorModel>();
  final searchDonors = Rxn<DonorModel>();
  DonorModel dummyData = DonorModel(donors: [], status: true);
  GetNetworks getNetworks = GetNetworks();
  Future<void> getSpecificDonor({required String bloodGroupID}) async {
    isDonorLoading.value = true;
    final response = await getNetworks.getData<DonorModel>(
      url: "/get-donor-blood-group?blood_group_id=$bloodGroupID",
      fromJson: (json) => DonorModel.fromJson(json),
    );
    response.fold(
      (left) {
        isDonorLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Blood Donor Status",
          description: left,
        );
      },
      (donorData) async {
        donors.value = donorData;
        searchDonors.value = donorData;
        isDonorLoading.value = false;
      },
    );
  }

  void filterDonor({required String value}) {
    if (value.isEmpty) {
      donors.value = searchDonors.value;
    } else {
      dummyData.donors = searchDonors.value!.donors!.where((element) {
        String donorName = element.name.toString().toLowerCase();
        String mobile = element.mobileNumber.toString().toLowerCase();
        return donorName.contains(value.toLowerCase()) ||
            mobile.contains(value.toLowerCase());
      }).toList();
      donors.value = DonorModel(donors: dummyData.donors);
    }
  }
}
