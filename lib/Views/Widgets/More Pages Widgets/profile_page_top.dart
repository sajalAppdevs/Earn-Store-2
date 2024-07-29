import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePageTop extends StatelessWidget {
  const ProfilePageTop({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismCard(
      boxHeight: 260.h,
      verticalPadding: 20.h,
      horizontalPadding: 20.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          userImage(),
          userInfo(),
        ],
      ),
    );
  }

  Widget userImage() {
    return Container(
      height: 128.h,
      width: 128.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            "${Paths.imagePath}blank_image.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget userInfo() {
    UserProfileController profileController = Get.put(UserProfileController());
    return Obx(
      () {
        String name = profileController.userData.value!.user!.name.toString();
        String title = profileController.userData.value!.user!.title.toString();
        return Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyles.customText(
                title: name,
                fontSize: 18.sp,
              ),
              SizedBox(height: 5.h),
              TextStyles.customText(
                title: title,
                fontSize: 14.sp,
              ),
            ],
          ),
        );
      },
    );
  }
}
