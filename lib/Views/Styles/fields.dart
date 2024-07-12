import 'dart:ui';

import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomField extends StatefulWidget {
  final double? height;
  final double? width;
  final int? maxLines;
  final double? bottomMargin;
  final double? paddingTop;
  final double? paddingLeft;
  final double? paddingRight;
  final String hintText;
  final bool? isReadOnly;
  final bool? isPassword;
  final VoidCallback? onTap;
  final void Function(String)? onPressed;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? iconColor;
  const CustomField({
    super.key,
    this.height,
    this.width,
    this.maxLines,
    this.bottomMargin,
    this.paddingTop,
    this.paddingLeft,
    this.paddingRight,
    required this.hintText,
    this.isReadOnly,
    this.onTap,
    this.onPressed,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.iconColor,
    this.isPassword,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool isView = true;
  @override
  Widget build(BuildContext context) {
    return widget.isPassword == null
        ? nonPassField()
        : Center(
            child: passField(),
          );
  }

  Widget nonPassField() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: widget.height ?? 48.h,
          width: widget.width ?? Get.width,
          margin: EdgeInsets.only(
            bottom: widget.bottomMargin ?? 0,
          ),
          padding: EdgeInsets.only(
            top: widget.paddingTop ?? 0,
            left: widget.paddingLeft ?? 20.w,
            right: widget.paddingRight ?? 20.w,
            bottom: 2.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
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
          child: TextField(
            controller: widget.controller,
            style: TextStyles.fieldTextStyle(),
            readOnly: widget.isReadOnly ?? false,
            onChanged: widget.onPressed,
            onTap: widget.onTap,
            maxLines: widget.maxLines ?? 1,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon == null
                  ? null
                  : Icon(
                      widget.suffixIcon,
                      size: 20.sp,
                      color: widget.iconColor ?? IconColors.iconColor1,
                    ),
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Icon(
                      widget.prefixIcon,
                      size: 20.sp,
                      color: widget.iconColor ?? IconColors.iconColor1,
                    ),
              hintStyle: TextStyles.fieldHintStyle(),
            ),
          ),
        ),
      ),
    );
  }

  Widget passField() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: widget.height ?? 48.h,
          width: widget.width ?? Get.width,
          margin: EdgeInsets.only(
            bottom: widget.bottomMargin ?? 0,
          ),
          padding: EdgeInsets.only(
            top: widget.paddingTop ?? 0,
            left: widget.paddingLeft ?? 20.w,
            right: widget.paddingRight ?? 5.w,
            bottom: 2.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
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
          child: TextField(
            controller: widget.controller,
            obscureText: isView,
            style: TextStyles.fieldTextStyle(),
            readOnly: widget.isReadOnly ?? false,
            onChanged: widget.onPressed,
            onTap: widget.onTap,
            maxLines: widget.maxLines ?? 1,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: widget.hintText,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isView = !isView;
                  });
                },
                icon: Icon(
                  isView ? Icons.remove_red_eye_outlined : Icons.lock_outline,
                  size: 20.sp,
                  color: IconColors.iconColor1,
                ),
              ),
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Icon(
                      widget.prefixIcon,
                      size: 20.sp,
                      color: IconColors.iconColor1,
                    ),
              hintStyle: TextStyles.fieldHintStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
