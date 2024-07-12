import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Tour%20Related%20Pages/tour_box.dart';
import 'package:flutter/material.dart';

class TourPage extends StatelessWidget {
  const TourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          CustomTop(title: "Tour Agencies"),
          TourBox(),
        ],
      ),
    );
  }
}
