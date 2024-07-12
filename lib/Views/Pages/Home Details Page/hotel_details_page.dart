import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/hotel_details_body.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/hotel_details_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const HotelDetailsTop(),
          SizedBox(height: 20.h),
          const HotelDetailsBody(),
        ],
      ),
    );
  }
}
