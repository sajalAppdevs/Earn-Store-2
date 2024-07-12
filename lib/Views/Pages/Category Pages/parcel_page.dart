import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Category%20Widgets/parcel_box.dart';
import 'package:flutter/material.dart';

class ParcelPage extends StatelessWidget {
  const ParcelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          CustomTop(title: "Parcel"),
          ParcelBox(),
        ],
      ),
    );
  }
}
