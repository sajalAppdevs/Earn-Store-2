import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleText extends StatelessWidget {
  final String title;
  final Alignment? alignment;
  final double? fontSize;
  final bool? hideAll;
  final VoidCallback? onPressed;
  const TitleText({
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextStyles.customText(
          title: title,
          fontSize: fontSize ?? 22.sp,
          fontWeight: FontWeight.w700,
        ),
        hideAll == null
            ? Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: GestureDetector(
                  onTap: onPressed ?? () {},
                  child: Image.asset(
                    "${Paths.iconPath}view_all.png",
                    height: 30.h,
                    width: 35.w,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
