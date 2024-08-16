import 'package:earn_store/Controllers/Home%20Controllers/general_info_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Earning%20Page%20Widgets/withdraw_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Withdraw Money"),
          SizedBox(height: 30.h),
          balanceWidget(),
          SizedBox(height: 30.h),
          const WithdrawBody()
        ],
      ),
    );
  }

  Widget balanceWidget() {
    UserProfileController userProfileController =
        Get.put(UserProfileController());
    GeneralInfoController generalInfoController =
        Get.put(GeneralInfoController());
    return Obx(
      () {
        String balance = generalInfoController.getBalance(
          userPoint: userProfileController.userData.value!.user!.point!.toInt(),
          currencyPerPoint: generalInfoController
              .generalInfos.value!.generalInfos!.point!
              .toDouble(),
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextStyles.customText(
              title:
                  "Your account balance is: ${userProfileController.userData.value!.user!.point.toString()} X ${generalInfoController.generalInfos.value!.generalInfos!.point.toString()}",
              fontSize: 14.sp,
            ),
            SizedBox(height: 10.h),
            TextStyles.customText(
              title: "$balance BDT",
              fontSize: 22.sp,
            )
          ],
        );
      },
    );
  }
}
