import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Snackbars {
  static SnackbarController successSnackBar({
    required String title,
    required String description,
  }) {
    return Get.showSnackbar(
      GetSnackBar(
        titleText: TextStyles.customText(
          title: title,
          textAlign: TextAlign.left,
          color: TextColors.textColor1,
          fontSize: 11.sp,
        ),
        messageText: TextStyles.customText(
          title: description,
          textAlign: TextAlign.left,
          color: TextColors.textColor1,
          fontWeight: FontWeight.w700,
          fontSize: 13.sp,
        ),
        backgroundColor: GeneralColors.successBarColor,
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.TOP,
        reverseAnimationCurve: Curves.bounceIn,
      ),
    );
  }

  static SnackbarController unSuccessSnackBar({
    required String title,
    required String description,
  }) {
    return Get.showSnackbar(
      GetSnackBar(
        titleText: TextStyles.customText(
          title: title,
          textAlign: TextAlign.left,
          color: TextColors.textColor1,
          fontSize: 11.sp,
        ),
        messageText: TextStyles.customText(
          title: description,
          textAlign: TextAlign.left,
          color: TextColors.textColor1,
          fontWeight: FontWeight.w700,
          fontSize: 13.sp,
        ),
        backgroundColor: GeneralColors.unSuccessBarColor,
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.TOP,
        reverseAnimationCurve: Curves.bounceIn,
      ),
    );
  }
}
