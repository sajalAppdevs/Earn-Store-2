import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Tour%20Related%20Pages/package_details_body.dart';
import 'package:earn_store/Views/Widgets/Tour%20Related%20Pages/package_details_top.dart';
import 'package:flutter/material.dart';

class PackageDetailsPage extends StatelessWidget {
  const PackageDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          PackageDetailsTop(),
          PackageDetailsBody(),
        ],
      ),
    );
  }
}
