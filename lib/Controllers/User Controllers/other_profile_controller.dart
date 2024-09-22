import 'package:earn_store/Models/User%20Models/user_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class OtherProfileController extends GetxController {
  RxBool otherProfileLoading = true.obs;
  final otherProfile = Rxn<UserModel>();
  GetNetworks getNetworks = GetNetworks();

  Future<void> getOtherProfile({required String userID}) async {
    otherProfileLoading.value = true;
    final response = await getNetworks.getData<UserModel>(
      url: "/get-user?userId=$userID",
      fromJson: (json) => UserModel.fromJson(json),
    );
    response.fold(
      (left) {
        otherProfileLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Other Profile Status",
          description: left,
        );
      },
      (otherProfileData) async {
        otherProfile.value = otherProfileData;
        otherProfileLoading.value = false;
      },
    );
  }
}
