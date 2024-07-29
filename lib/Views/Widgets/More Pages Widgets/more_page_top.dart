import 'package:earn_store/Controllers/More%20Controllers/more_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MorePageTop extends StatefulWidget {
  const MorePageTop({super.key});

  @override
  State<MorePageTop> createState() => _MorePageTopState();
}

class _MorePageTopState extends State<MorePageTop> {
  String todayDate = "";
  MoreController moreController = Get.put(MoreController());

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    todayDate = moreController.todaysDate();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        GlassmorphismCard(
          boxHeight: 160.h,
          verticalPadding: 15.h,
          horizontalPadding: 15.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userInfo(),
              SizedBox(height: 10.h),
              levelAndWithdraw(),
              SizedBox(height: 10.h),
              TextStyles.customText(
                title: todayDate,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget userInfo() {
    UserProfileController profileController = Get.put(UserProfileController());
    return Obx(
      () {
        String name = profileController.userData.value!.user!.name.toString();
        String email = profileController.userData.value!.user!.email.toString();
        return Row(
          children: [
            userImage(),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyles.customText(
                  title: name,
                  fontSize: 14.sp,
                ),
                TextStyles.customText(
                  title: email,
                  fontSize: 14.sp,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Widget levelAndWithdraw() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextStyles.customText(
          title: "Level 04",
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        GlassmorphismCard(
          boxHeight: 40.h,
          boxWidth: 115.w,
          borderRadius: 30.r,
          child: TextStyles.customText(
            title: "Withdraw",
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  Widget userImage() {
    return Container(
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
    );
  }
}
