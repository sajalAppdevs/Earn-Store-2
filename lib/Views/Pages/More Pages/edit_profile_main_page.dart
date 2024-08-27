import 'dart:io';

import 'package:earn_store/Controllers/User%20Controllers/user_edit_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/pic_edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileMainPage extends StatefulWidget {
  const EditProfileMainPage({super.key});

  @override
  State<EditProfileMainPage> createState() => _EditProfileMainPageState();
}

class _EditProfileMainPageState extends State<EditProfileMainPage> {
  UserProfileController userProfileController = Get.put(
    UserProfileController(),
  );
  UserEditController controller = Get.put(UserEditController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setData();
  }

  void setData() {
    setState(() {
      nameController.text =
          userProfileController.userData.value!.user!.name.toString();
      emailController.text =
          userProfileController.userData.value!.user!.email.toString();
      mobileController.text =
          userProfileController.userData.value!.user!.mobile.toString();
    });
  }

  String imagePath = "";

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return RootDesign(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const CustomTop(title: "Edit Profile"),
              PicEditWidget(
                imagePath: imagePath,
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    imagePath = image!.path;
                  });
                },
              ),
              SizedBox(height: 30.h),
              editProfileBody(),
              SizedBox(height: 100.h),
              controller.updateLoading.value
                  ? const ButtonLoading()
                  : CustomButton(
                      horizontalMargin: 20.w,
                      onPressed: () async {
                        await controller.updateInfo(
                          name: nameController.text,
                          email: emailController.text,
                          mobile: mobileController.text,
                          image: File(imagePath),
                        );
                      },
                      buttonText: "Update",
                    ),
              SizedBox(height: 70.h),
            ],
          ),
        );
      },
    );
  }

  Widget editProfileBody() {
    return PaddedScreen(
      padding: 15.w,
      child: Column(
        children: [
          customText(title: "Name"),
          SizedBox(height: 10.h),
          CustomField(
            hintText: "",
            controller: nameController,
          ),
          SizedBox(height: 30.h),
          customText(title: "Email"),
          SizedBox(height: 10.h),
          CustomField(
            hintText: "",
            controller: emailController,
          ),
          SizedBox(height: 30.h),
          customText(title: "Mobile No"),
          SizedBox(height: 10.h),
          CustomField(
            hintText: "",
            controller: mobileController,
          ),
        ],
      ),
    );
  }

  Widget customText({required String title}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextStyles.customText(title: title),
    );
  }
}
