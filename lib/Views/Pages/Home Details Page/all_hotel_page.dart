import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/all_hotel_box.dart';
import 'package:flutter/material.dart';

class AllHotelPage extends StatelessWidget {
  const AllHotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          CustomTop(title: "Hotel Booking"),
          PaddedScreen(
            child: Column(
              children: [
                AllHotelBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
