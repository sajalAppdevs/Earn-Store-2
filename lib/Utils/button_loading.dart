import 'package:earn_store/Statics/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ButtonLoading extends StatelessWidget {
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? loadingColor;
  final double? loadingSize;
  const ButtonLoading({
    super.key,
    this.verticalPadding,
    this.horizontalPadding,
    this.loadingColor,
    this.loadingSize,
  });

  @override
  Widget build(BuildContext context) {
    var spinkit = SpinKitThreeBounce(
      color: loadingColor ?? TextColors.textColor1,
      size: loadingSize ?? 30.0.sp,
    );
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? 0,
        horizontal: horizontalPadding ?? 0,
      ),
      child: Center(
        child: spinkit,
      ),
    );
  }
}
