import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/More%20Controllers/more_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Level"),
          SizedBox(height: 20.h),
          levelBox(),
        ],
      ),
    );
  }

  Widget levelBox() {
    UserProfileController profileController = Get.put(UserProfileController());
    MoreController moreController = Get.put(MoreController());
    String todayDate = moreController.todaysDate();
    return Obx(
      () {
        return PaddedScreen(
          child: GlassmorphismCard(
            boxHeight: 160.h,
            verticalPadding: 15.h,
            horizontalPadding: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageAndInfo(),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextStyles.customText(
                      title:
                          "Level ${profileController.userData.value!.user!.userLevel.toString()}",
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                    CustomButton(
                      width: 115.w,
                      onPressed: () {},
                      buttonText: "Withdraw",
                      textSize: 15.sp,
                    )
                  ],
                ),
                SizedBox(height: 5.h),
                TextStyles.customText(
                  title: todayDate,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget userImage() {
    UserProfileController profileController = Get.put(UserProfileController());
    return Obx(
      () {
        return CachedNetworkImage(
          imageUrl: profileController.userData.value!.user!.imageUrl.toString(),
          imageBuilder: (context, imageProvider) => Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => ButtonLoading(loadingSize: 15.sp),
          errorWidget: (context, url, error) => Container(
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
        );
      },
    );
  }

  Widget imageAndInfo() {
    UserProfileController profileController = Get.put(UserProfileController());
    return Obx(
      () {
        return Row(
          children: [
            userImage(),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyles.customText(
                  title:
                      profileController.userData.value!.user!.name.toString(),
                  fontSize: 14.sp,
                ),
                TextStyles.customText(
                  title:
                      profileController.userData.value!.user!.email.toString(),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
