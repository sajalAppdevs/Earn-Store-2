import 'dart:ui';
import 'package:earn_store/Controllers/User%20Controllers/other_profile_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/date_helpers.dart';
import 'package:earn_store/Views/Pages/More%20Pages/edit_profile_second_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtherProfileBody extends StatelessWidget {
  const OtherProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    OtherProfileController controller = Get.put(OtherProfileController());
    return Obx(
      () {
        String joinedDate = DateHelpers.formatDate(
          controller.otherProfile.value!.user!.createdAt.toString(),
        );
        String workPlace =
            controller.otherProfile.value!.user!.workingAt == null
                ? "Not setted yet."
                : controller.otherProfile.value!.user!.workingAt.toString();
        String education =
            controller.otherProfile.value!.user!.studiedAt == null
                ? "Not setted yet."
                : controller.otherProfile.value!.user!.studiedAt.toString();
        String livesAt = controller.otherProfile.value!.user!.address == null
            ? "Not setted yet."
            : controller.otherProfile.value!.user!.address.toString();
        String relationShip =
            controller.otherProfile.value!.user!.relationship == null
                ? "Not setted yet."
                : controller.otherProfile.value!.user!.relationship.toString();
        return ClipRRect(
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
                    text: workPlace,
                  ),
                  SizedBox(height: 15.h),
                  infoRow(
                    imagePath: "education.png",
                    height: 23.h,
                    width: 32.w,
                    text: education,
                  ),
                  SizedBox(height: 15.h),
                  infoRow(
                    imagePath: "house.png",
                    height: 27.h,
                    width: 30.w,
                    text: "Lives in $livesAt",
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: infoRow(
                      imagePath: "location.png",
                      height: 20.h,
                      width: 18.w,
                      text: livesAt,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  infoRow(
                    imagePath: "heart_full.png",
                    height: 24.h,
                    width: 28.w,
                    text: relationShip,
                  ),
                  SizedBox(height: 15.h),
                  infoRow(
                    imagePath: "clock.png",
                    height: 24.h,
                    width: 28.w,
                    text: "Joined $joinedDate",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget infoRow({
    required String imagePath,
    required double height,
    required double width,
    required String text,
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
          child: TextStyles.customText(
            title: text,
            fontSize: 14.sp,
            textAlign: TextAlign.left,
            isShowAll: true,
          ),
        )
      ],
    );
  }

  Widget editIcon() {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () {
          Get.to(
            const EditProfileSecondPage(),
          );
        },
        splashRadius: 1,
        icon: const Icon(
          Icons.edit,
          color: TextColors.textColor1,
        ),
      ),
    );
  }
}
