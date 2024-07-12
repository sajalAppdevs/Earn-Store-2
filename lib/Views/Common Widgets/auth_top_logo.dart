import 'package:earn_store/Statics/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTopLogo extends StatelessWidget {
  const AuthTopLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "${Paths.iconPath}main_logo.png",
        height: 82.h,
        width: 100.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
