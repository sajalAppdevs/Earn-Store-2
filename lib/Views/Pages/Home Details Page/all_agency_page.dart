import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/all_agency_box.dart';
import 'package:flutter/material.dart';

class AllAgencyPage extends StatelessWidget {
  const AllAgencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          CustomTop(title: "Agency"),
          PaddedScreen(
            child: Column(
              children: [
                AllAgencyBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
