import 'package:earn_store/Models/User%20Models/user_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  final userData = Rxn<UserModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getUserProfile() async {
    int userID = await LocalStorage.getUserID();
    final response = await getNetworks.getData<UserModel>(
      url: "/get-user?userId=$userID",
      fromJson: (json) => UserModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Profile Status",
          description: left,
        );
      },
      (userInfo) async {
        userData.value = userInfo;
      },
    );
  }
}
