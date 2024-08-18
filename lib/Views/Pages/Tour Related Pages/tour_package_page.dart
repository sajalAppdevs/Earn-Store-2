import 'package:earn_store/Controllers/Home%20Controllers/tour_package_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Tour%20Related%20Pages/tour_package_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TourPackagePage extends StatefulWidget {
  final String agencyID;
  const TourPackagePage({
    super.key,
    required this.agencyID,
  });

  @override
  State<TourPackagePage> createState() => _TourPackagePageState();
}

class _TourPackagePageState extends State<TourPackagePage> {
  TourPackageController controller = Get.put(TourPackageController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getPackageByAgency(agencyID: widget.agencyID);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.packageLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    CustomTop(title: "Packages"),
                    TourPackageBox(),
                  ],
                ),
              );
      },
    );
  }
}
