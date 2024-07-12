import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/rounded_button.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/help_center_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
      child: Row(
        children: [
          listIcon(),
          SizedBox(width: 100.w),
          mainLogo(),
          SizedBox(width: 45.w),
          notificationIcon(),
          SizedBox(width: 15.w),
          shareIcon(),
        ],
      ),
    );
  }

  Widget listIcon() {
    return RoundedButton(
      height: 40.h,
      width: 40.w,
      onPressed: () {
        Get.to(
          const HelpCenterPage(),
        );
      },
      child: Image.asset(
        "${Paths.iconPath}list.png",
        height: 23.h,
        width: 23.w,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget mainLogo() {
    return Image.asset(
      "${Paths.iconPath}main_logo.png",
      height: 51.h,
      width: 63.w,
      fit: BoxFit.fill,
    );
  }

  Widget notificationIcon() {
    return RoundedButton(
      height: 40.h,
      width: 40.w,
      paddingLeft: 7.w,
      paddingTop: 5.h,
      onPressed: () {},
      child: Image.asset(
        "${Paths.iconPath}notification.png",
        height: 38.h,
        width: 38.w,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget shareIcon() {
    return RoundedButton(
      height: 40.h,
      width: 40.w,
      onPressed: () {},
      child: Image.asset(
        "${Paths.iconPath}share.png",
        height: 21.h,
        width: 21.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
