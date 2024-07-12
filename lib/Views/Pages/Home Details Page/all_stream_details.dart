import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/all_stream_details_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllStreamDetails extends StatelessWidget {
  const AllStreamDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Pelf Earn"),
          SizedBox(height: 10.h),
          PaddedScreen(
            padding: 10.w,
            child: Column(
              children: [
                streamLogo(),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          const AllStreamDetailsBox(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget streamLogo() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Image.asset(
        "${Paths.iconPath}hoichoi.png",
        height: 24.h,
        width: 80.w,
      ),
    );
  }
}
