import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DonorProfilePage extends StatelessWidget {
  const DonorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(
            title: "Donar Profile",
          ),
          SizedBox(height: 30.h),
          profileInfoBox(),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  Widget profileInfoBox() {
    UserProfileController userProfileController =
        Get.put(UserProfileController());
    return Obx(
      () {
        return PaddedScreen(
          padding: 15.w,
          child: GlassmorphismCard(
            boxHeight: 300.h,
            verticalPadding: 15.h,
            horizontalPadding: 10.w,
            child: Column(
              children: [
                userImage(),
                customDivider(),
                infoRow(
                  title: "Name",
                  info: userProfileController.userData.value!.user!.name
                      .toString(),
                ),
                customDivider(),
                infoRow(
                  title: "Blood Group",
                  info: userProfileController.userData.value!.user!.bloodGroup
                      .toString(),
                ),
                customDivider(),
                infoRow(
                  title: "Gender",
                  info: userProfileController.userData.value!.user!.gender
                      .toString(),
                ),
                customDivider(),
                infoRow(
                  title: "Mobile Number",
                  info: userProfileController.userData.value!.user!.mobile
                      .toString(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget userImage() {
    return PaddedScreen(
      padding: 15.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextStyles.customText(
            title: "Profile Photo",
            fontSize: 16.sp,
          ),
          Container(
            height: 40.h,
            width: 40.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  "${Paths.imagePath}blank_image.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Divider(
        color: TextColors.textColor1,
        height: 0.8.h,
        thickness: 0.5,
      ),
    );
  }

  Widget infoRow({
    required String title,
    required String info,
  }) {
    return PaddedScreen(
      padding: 15.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextStyles.customText(
            title: title,
          ),
          TextStyles.customText(
            title: info,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
