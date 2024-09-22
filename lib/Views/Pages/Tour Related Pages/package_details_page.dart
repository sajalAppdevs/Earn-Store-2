import 'package:earn_store/Controllers/Home%20Controllers/tour_package_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Tour%20Related%20Pages/package_details_body.dart';
import 'package:earn_store/Views/Widgets/Tour%20Related%20Pages/package_details_top.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackageDetailsPage extends StatefulWidget {
  final String packageID;
  const PackageDetailsPage({
    super.key,
    required this.packageID,
  });

  @override
  State<PackageDetailsPage> createState() => _PackageDetailsPageState();
}

class _PackageDetailsPageState extends State<PackageDetailsPage> {
  TourPackageController controller = Get.put(TourPackageController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getPackageDetails(
      packageID: widget.packageID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.packageDetailsLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const PackageDetailsTop(),
                    PackageDetailsBody(
                      packageID: widget.packageID,
                    ),
                  ],
                ),
              );
      },
    );
  }
}
