import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DonorEditProfile extends StatelessWidget {
  const DonorEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(
            title: "Donar Edit Profile",
          ),
          SizedBox(height: 30.h),
          profileInfoBox(),
          SizedBox(height: 100.h),
          PaddedScreen(
            child: CustomButton(
              onPressed: () {
                Get.offAll(
                  const RootScreen(),
                );
              },
              buttonText: "Save",
            ),
          )
        ],
      ),
    );
  }

  Widget profileInfoBox() {
    return PaddedScreen(
      padding: 15.w,
      child: GlassmorphismCard(
        boxHeight: 350.h,
        verticalPadding: 15.h,
        horizontalPadding: 10.w,
        child: Column(
          children: [
            userImage(),
            customDivider(),
            infoRow(
              title: "Name",
              info: "Rashidatul Kobra",
            ),
            customDivider(),
            infoRow(
              title: "Blood Group",
              info: "O Positive",
            ),
            customDivider(),
            infoRow(
              title: "Gender",
              info: "Female",
            ),
            customDivider(),
            infoRow(
              title: "Age",
              info: "24",
            ),
            customDivider(),
            infoRow(
              title: "Mobile Number",
              info: "+8801753227645",
            ),
          ],
        ),
      ),
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
