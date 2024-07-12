
import 'package:earn_store/Statics/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddedScreen extends StatelessWidget {
  final double? padding;
  final Widget child;
  const PaddedScreen({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding ?? AppPaddings.screenPadding.w,
      ),
      child: child,
    );
  }
}