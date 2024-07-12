import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/more_page_body.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/more_page_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: PaddedScreen(
        padding: 15.w,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const MorePageTop(),
            SizedBox(height: 20.h),
            const MorePageBody(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
