import 'dart:io';

import 'package:earn_store/Networks/image_post_network.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:get/get.dart';

class UserEditController extends GetxController {
  RxBool updateLoading = false.obs;

  RxString imagePath = "".obs;
  ImagePostNetwork imagePostNetwork = ImagePostNetwork();
  PostNetworks postNetworks = PostNetworks();
  Future<void> updateInfo({
    required String name,
    required String email,
    required String mobile,
    required File image,
  }) async {
    updateLoading.value = true;
    int userID = await LocalStorage.getUserID();
    bool status = await imagePostNetwork.addImagePosts(
      url: "/edit-user?userId=$userID",
      imageKey: "image",
      image: image,
      parameters: {
        "name": name,
        "email": email,
        "mobile": mobile,
      },
    );
    if (status) {
      updateLoading.value = false;
      Snackbars.successSnackBar(
          title: "Update Status", description: "Profile Updated");
      Get.offAll(
        const RootScreen(),
      );
    } else {
      updateLoading.value = false;
      Snackbars.unSuccessSnackBar(
          title: "Update Status", description: "Failed to update profile");
    }
  }

  Future<void> updateDetailsInfo({
    required String study,
    required String working,
    required String address,
    required String relationship,
  }) async {
    updateLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postDataWithoutResponse(
      url: "/profile-update?id=$userID",
      body: {
        "studied_at": study,
        "working_at": working,
        "address": address,
        "relationship": relationship,
      },
    );
    response.fold(
      (left) {
        updateLoading.value = false;
        Snackbars.unSuccessSnackBar(
            title: "Update Status", description: "Failed to update profile");
      },
      (status) async {
        if (status == 200) {
          updateLoading.value = false;
          Snackbars.successSnackBar(
              title: "Update Status", description: "Profile Updated");
          Get.offAll(
            const RootScreen(),
          );
        } else {
          updateLoading.value = false;
          Snackbars.unSuccessSnackBar(
              title: "Update Status", description: "Failed to update profile");
        }
      },
    );
  }
}
