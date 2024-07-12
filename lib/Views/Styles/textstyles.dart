import 'package:earn_store/Statics/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static Widget customText({
    required String title,
    Color? color,
    bool? isShowAll,
    FontWeight? fontWeight,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return Text(
      title,
      overflow: isShowAll == true ? null : TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.center,
      style: GoogleFonts.poppins(
        color: color ?? TextColors.textColor1,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 16.sp,
      ),
    );
  }

  static TextStyle fieldHintStyle({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return GoogleFonts.poppins(
      color: color ?? TextColors.textColor1,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: fontSize ?? 13.sp,
    );
  }

  static TextStyle fieldTextStyle({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return GoogleFonts.poppins(
      color: color ?? TextColors.textColor1,
      fontWeight: fontWeight ?? FontWeight.w600,
      fontSize: fontSize ?? 13.sp,
    );
  }
}
