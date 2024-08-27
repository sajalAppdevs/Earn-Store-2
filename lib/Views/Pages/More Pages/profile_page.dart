import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/profile_page_body.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/profile_page_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Profile"),
          PaddedScreen(
            child: Column(
              children: [
                const ProfilePageTop(),
                SizedBox(height: 15.h),
                const ProfilePageBody(),
                // SizedBox(height: 20.h),
                // ProfilePageBox(
                //   onPressed: () {},
                //   title: "Total Earning",
                //   info: "8550.00 ৳",
                // ),
                // SizedBox(height: 15.h),
                // ProfilePageBox(
                //   onPressed: () {},
                //   title: "Total Earning",
                //   info: "8550.00 ৳",
                // ),
                // SizedBox(height: 15.h),
                // ProfilePageBox(
                //   onPressed: () {},
                //   title: "Total Earning",
                //   info: "8550.00 ৳",
                // ),
                // SizedBox(height: 20.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
