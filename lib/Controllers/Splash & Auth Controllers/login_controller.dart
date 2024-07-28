import 'package:earn_store/Models/Auth%20Models/login_model.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool loginLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  PostNetworks postNetworks = PostNetworks();
  Future<void> getUserLogin() async {
    if (emailController.text.isEmpty) {
      Snackbars.unSuccessSnackBar(
        title: "User Login",
        description: "Please fill email",
      );
    } else if (passwordController.text.isEmpty) {
      Snackbars.unSuccessSnackBar(
        title: "User Login",
        description: "Please fill password",
      );
    } else {
      loginLoading.value = true;
      final response = await postNetworks.postData<LoginModel>(
        url: "/login",
        body: {
          "email": emailController.text,
          "password": passwordController.text,
        },
        fromJson: (json) => LoginModel.fromJson(json),
      );
      response.fold(
        (left) {
          Snackbars.unSuccessSnackBar(
            title: "User Login",
            description: left,
          );
          loginLoading.value = false;
        },
        (loginData) async {
          if (loginData.status == "Failed") {
            Snackbars.unSuccessSnackBar(
                title: "User Login", description: loginData.messege.toString());
          } else {
            await LocalStorage.setUserID(
                userID: loginData.user!.userid!.toInt());
            Get.offAll(
              const RootScreen(),
            );
          }
          loginLoading.value = false;
        },
      );
    }
  }
}
