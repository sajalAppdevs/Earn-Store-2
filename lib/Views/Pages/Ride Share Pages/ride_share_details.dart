import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Ride%20Share%20Widgets/ride_share_details_top.dart';
import 'package:earn_store/Views/Widgets/Ride%20Share%20Widgets/ride_share_recommended.dart';
import 'package:earn_store/Views/Widgets/Ride%20Share%20Widgets/ride_vehicle_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RideShareDetails extends StatelessWidget {
  const RideShareDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const RideShareDetailsTop(),
          PaddedScreen(
            child: CustomField(
              hintText: "Search",
              controller: TextEditingController(),
              suffixIcon: Icons.search,
            ),
          ),
          SizedBox(height: 30.h),
          const RideVehicleSelector(),
          SizedBox(height: 30.h),
          const RideShareRecommended()
        ],
      ),
    );
  }
}
