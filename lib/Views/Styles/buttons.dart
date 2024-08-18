import 'dart:ui';

import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color? textColor;
  final Color? buttonColor;
  final Color? borderColor;
  final double? textSize;
  final double? height;
  final double? width;
  final double? verticalMargin;
  final double? horizontalMargin;
  final bool? isCenter;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.textColor,
    this.buttonColor,
    this.borderColor,
    this.textSize,
    this.height,
    this.width,
    this.verticalMargin,
    this.horizontalMargin,
    this.isCenter,
  });

  @override
  Widget build(BuildContext context) {
    return isCenter == null
        ? button()
        : Center(
            child: button(),
          );
  }

  Widget button() {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            height: height ?? 48.h,
            width: width ?? 315.w,
            margin: EdgeInsets.symmetric(
              vertical: verticalMargin ?? 0,
              horizontal: horizontalMargin ?? 0,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: buttonColor ?? ButtonColors.buttonColor2,
              border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: 1.w,
              ),
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
            child: TextStyles.customText(
              title: buttonText,
              fontSize: textSize ?? 16.sp,
              color: GeneralColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
