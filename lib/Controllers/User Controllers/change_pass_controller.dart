import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:get/get.dart';

class ChangePassController extends GetxController {
  RxBool changePassLoading = false.obs;
  PostNetworks postNetworks = PostNetworks();

  Future<void> changePass({
    required String mobile,
    required String newPass,
    required String confirmPass,
  }) async {
    changePassLoading.value = true;
    if (mobile.isEmpty || newPass.isEmpty || confirmPass.isEmpty) {
      Snackbars.unSuccessSnackBar(
          title: "Change Password Status",
          description: "Please fill all fields");
    }
    final response = await postNetworks.postDataWithoutResponse(
      url: "/forgot-password",
      body: {
        "mobile": mobile,
        "new_password": newPass,
        "confirm_password": confirmPass,
      },
    );
    response.fold(
      (left) {
        changePassLoading.value = false;
        Snackbars.unSuccessSnackBar(
            title: "Change Password Status",
            description: "Failed to change password");
      },
      (status) async {
        if (status == 200) {
          changePassLoading.value = false;
          Snackbars.successSnackBar(
              title: "Change Password Status", description: "Password Changed");
          Get.offAll(
            const RootScreen(),
          );
        } else {
          changePassLoading.value = false;
          Snackbars.unSuccessSnackBar(
              title: "Change Password Status",
              description: "Failed to change password");
        }
      },
    );
  }
}
