import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Ride%20Share%20Pages/ride_share_details.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RideSharePage extends StatelessWidget {
  const RideSharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Ride Sharing Apps"),
          SizedBox(height: 20.h),
          rideShareApps(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget rideShareApps() {
    return PaddedScreen(
      child: GridView.builder(
        itemCount: 10,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
          childAspectRatio: 1 / 0.5,
        ),
        itemBuilder: (context, index) {
          return GlassmorphismCard(
            onPressed: () {
              Get.to(
                const RideShareDetails(),
              );
            },
            child: Image.asset(
              "${Paths.iconPath}uber.png",
              height: 40.h,
              width: 88.w,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
