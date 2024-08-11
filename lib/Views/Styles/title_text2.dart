import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleText2 extends StatelessWidget {
  final String title;
  final Alignment? alignment;
  final double? fontSize;
  final bool? hideAll;
  final VoidCallback? onPressed;
  const TitleText2({
    super.key,
    required this.title,
    this.alignment,
    this.fontSize,
    this.hideAll,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextStyles.customText(
          title: title,
          fontSize: fontSize ?? 22.sp,
          fontWeight: FontWeight.w700,
        ),
        hideAll == null
            ? GestureDetector(
                onTap: onPressed,
                child: Row(
                  children: [
                    TextStyles.customText(
                      title: "View more",
                      fontSize: 12.sp,
                    ),
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15.sp,
                      color: TextColors.textColor1,
                    )
                  ],
                ),
              )
            : Container()
      ],
    );
  }
}
