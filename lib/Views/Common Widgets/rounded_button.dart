import 'package:earn_store/Statics/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final Widget child;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;
  const RoundedButton({
    super.key,
    this.onPressed,
    this.height,
    this.width,
    required this.child,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        height: height ?? 47.h,
        width: height ?? 47.w,
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          top: paddingTop ?? 0,
          bottom: paddingBottom ?? 0,
          left: paddingLeft ?? 0,
          right: paddingRight ?? 0,
        ),
        decoration: BoxDecoration(
          color: GeneralColors.blackColor.withOpacity(0.33),
          shape: BoxShape.circle,
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
        child: child,
      ),
    );
  }
}
