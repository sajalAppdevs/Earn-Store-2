import 'dart:ui';

import 'package:earn_store/Controllers/User%20Controllers/user_edit_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileSecondPage extends StatefulWidget {
  const EditProfileSecondPage({super.key});

  @override
  State<EditProfileSecondPage> createState() => _EditProfileSecondPageState();
}

class _EditProfileSecondPageState extends State<EditProfileSecondPage> {
  UserProfileController userProfileController = Get.put(
    UserProfileController(),
  );
  UserEditController controller = Get.put(UserEditController());
  TextEditingController studyController = TextEditingController();
  TextEditingController workingController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setData();
  }

  void setData() {
    setState(() {
      studyController.text =
          userProfileController.userData.value!.user!.studiedAt.toString();
      workingController.text =
          userProfileController.userData.value!.user!.workingAt.toString();
      addressController.text =
          userProfileController.userData.value!.user!.address.toString();
      relationshipController.text =
          userProfileController.userData.value!.user!.relationship.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return RootDesign(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const CustomTop(title: "Edit Profile"),
              SizedBox(height: 50.h),
              PaddedScreen(
                padding: 12.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                        vertical: 20.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: GlassMorphismColors.glassColor1,
                        boxShadow: [
                          BoxShadow(
                            color: GeneralColors.shadowColor1.withOpacity(0.26),
                            blurRadius: 2,
                            spreadRadius: 0,
                            offset: const Offset(1.18, 1.18),
                          ),
                          BoxShadow(
                            color: GeneralColors.blackColor.withOpacity(0.30),
                            blurRadius: 2,
                            spreadRadius: 0,
                            offset: const Offset(-1.18, -1.18),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextStyles.customText(
                            title: "Details",
                            fontSize: 18.sp,
                          ),
                          SizedBox(height: 20.h),
                          infoRow(
                            imagePath: "work.png",
                            height: 30.h,
                            width: 30.w,
                            controller: workingController,
                            hintText: "Work..",
                          ),
                          SizedBox(height: 15.h),
                          infoRow(
                            imagePath: "education.png",
                            height: 23.h,
                            width: 32.w,
                            controller: studyController,
                            hintText: "Studies...",
                          ),
                          SizedBox(height: 15.h),
                          infoRow(
                            imagePath: "house.png",
                            height: 27.h,
                            width: 30.w,
                            controller: addressController,
                            hintText: "Address",
                          ),
                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: infoRow(
                              imagePath: "location.png",
                              height: 20.h,
                              width: 18.w,
                              controller: addressController,
                              hintText: "Address",
                            ),
                          ),
                          SizedBox(height: 15.h),
                          infoRow(
                            imagePath: "heart_full.png",
                            height: 24.h,
                            width: 28.w,
                            controller: relationshipController,
                            hintText: "Relationship...",
                          ),
                          SizedBox(height: 50.h),
                          controller.updateLoading.value
                              ? const ButtonLoading()
                              : CustomButton(
                                  onPressed: ()async {
                                   await controller.updateDetailsInfo(
                                      study: studyController.text,
                                      working: workingController.text,
                                      address: addressController.text,
                                      relationship: relationshipController.text,
                                    );
                                  },
                                  buttonText: "Update",
                                ),
                          SizedBox(height: 50.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget infoRow({
    required String imagePath,
    required double height,
    required double width,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Row(
      children: [
        Image.asset(
          Paths.iconPath + imagePath,
          height: height,
          width: width,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 10.w),
        SizedBox(
          width: 240.w,
          child: CustomField(
            hintText: hintText,
            controller: controller,
          ),
        )
      ],
    );
  }
}
