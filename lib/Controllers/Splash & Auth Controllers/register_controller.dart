import 'package:earn_store/Controllers/Splash%20&%20Auth%20Controllers/country_controller.dart';
import 'package:earn_store/Models/Auth%20Models/register_model.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  CountryController countryController = Get.put(CountryController());
  RxBool registerLoading = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController referCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  PostNetworks postNetworks = PostNetworks();
  Future<void> getUserRegister() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        mobileController.text.isEmpty ||
        passwordController.text.isEmpty ||
        countryController.countryID.value == 0) {
      Snackbars.unSuccessSnackBar(
        title: "User Register",
        description: "Please fill all fields",
      );
    } else {
      registerLoading.value = true;
      final response = await postNetworks.postData<RegisterModel>(
        url: "/register",
        body: {
          "name": nameController.text,
          "email": emailController.text,
          "mobile": mobileController.text,
          "password": passwordController.text,
          "refer": referCodeController.text,
          "country": countryController.countryID.value.toString(),
        },
        fromJson: (json) => RegisterModel.fromJson(json),
      );
      response.fold(
        (left) {
          Snackbars.unSuccessSnackBar(
            title: "User Register",
            description: left,
          );
          registerLoading.value = false;
        },
        (registerData) async {
          if (registerData.status == "Failed") {
            Snackbars.unSuccessSnackBar(
              title: "User Register",
              description: registerData.message.toString(),
            );
          } else {
            await LocalStorage.setUserID(userID: registerData.userID!.toInt());
            Get.to(
              const OTPPage(),
            );
          }
          registerLoading.value = false;
        },
      );
    }
  }
}
