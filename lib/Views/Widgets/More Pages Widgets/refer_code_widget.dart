import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeReferCode extends StatelessWidget {
  const HomeReferCode({super.key});

  @override
  Widget build(BuildContext context) {
    UserProfileController controller = Get.put(UserProfileController());
    String referCode = controller.userData.value!.user!.myReferCode.toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextStyles.customText(
          title: "Refercode:",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        Row(
          children: [
            SizedBox(width: 10.w),
            TextStyles.customText(
              title: "123456",
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: TextColors.textColor2,
            ),
            copyButton(referCode: referCode, context: context),
          ],
        ),
      ],
    );
  }

  Widget copyButton({
    required String referCode,
    required BuildContext context,
  }) {
    return IconButton(
      onPressed: () async {
        await Clipboard.setData(
          ClipboardData(
            text: referCode,
          ),
        );
        Snackbars.successSnackBar(
            title: "Refer Code Status",
            description: "Refer Code copied to your clipboard");
      },
      icon: Icon(
        Icons.copy,
        color: TextColors.textColor1,
        size: 20.sp,
      ),
    );
  }
}
