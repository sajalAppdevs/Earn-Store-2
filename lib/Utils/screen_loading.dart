import 'package:earn_store/Statics/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScreenLoading extends StatelessWidget {
  const ScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    var spinkit = SpinKitCircle(
      color: TextColors.textColor1,
      size: 50.0.sp,
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: spinkit,
        ),
      ),
    );
  }
}
