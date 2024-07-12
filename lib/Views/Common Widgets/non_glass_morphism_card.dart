import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NonGlassMorphismCard extends StatelessWidget {
  final Widget child;
  final double? boxHeight;
  final double? boxWidth;
  final double? boxLeftMargin;
  final double? boxRightMargin;
  final double? boxBottomMargin;
  final double? boxTopMargin;
  final double? verticalMargin;
  final double? horizontalMargin;
  final double? boxLeftPadding;
  final double? boxRightPadding;
  final double? boxBottomPadding;
  final double? boxTopPadding;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? borderRadius;
  final Color? borderColor;
  final Alignment? childAlignment;
  final bool? isCenter;
  const NonGlassMorphismCard({
    super.key,
    this.boxHeight,
    this.boxWidth,
    this.boxLeftMargin,
    this.boxRightMargin,
    this.boxBottomMargin,
    this.boxTopMargin,
    this.verticalMargin,
    this.horizontalMargin,
    this.boxLeftPadding,
    this.boxRightPadding,
    this.boxBottomPadding,
    this.boxTopPadding,
    this.verticalPadding,
    this.horizontalPadding,
    this.borderRadius,
    required this.child,
    this.borderColor,
    this.childAlignment,
    this.isCenter,
  });

  @override
  Widget build(BuildContext context) {
    return isCenter == null
        ? glassBox()
        : Center(
            child: glassBox(),
          );
  }

  Widget glassBox() {
    return Container(
      height: boxHeight ?? 260.h,
      width: boxWidth ?? 330.w,
      margin: verticalMargin == null && horizontalMargin == null
          ? EdgeInsets.only(
              top: boxTopMargin ?? 0,
              bottom: boxBottomMargin ?? 0,
              left: boxLeftMargin ?? 0,
              right: boxRightMargin ?? 0,
            )
          : EdgeInsets.symmetric(
              vertical: verticalMargin ?? 0,
              horizontal: horizontalMargin ?? 0,
            ),
      padding: verticalPadding == null && horizontalPadding == null
          ? EdgeInsets.only(
              top: boxTopPadding ?? 0,
              bottom: boxBottomPadding ?? 0,
              left: boxLeftPadding ?? 0,
              right: boxRightPadding ?? 0,
            )
          : EdgeInsets.symmetric(
              vertical: verticalPadding ?? 0,
              horizontal: horizontalPadding ?? 0,
            ),
      alignment: childAlignment,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
        color: Colors.transparent,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: 1.w,
        ),
      ),
      child: child,
    );
  }
}
