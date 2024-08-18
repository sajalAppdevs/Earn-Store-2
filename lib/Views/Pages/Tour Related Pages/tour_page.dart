import 'package:earn_store/Controllers/Home%20Controllers/tour_agency_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Tour%20Related%20Pages/tour_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TourPage extends StatefulWidget {
  const TourPage({super.key});

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  TourAgencyController controller = Get.put(TourAgencyController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getAllAgencies();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.agenciesLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    CustomTop(title: "Tour Agencies"),
                    TourBox(),
                  ],
                ),
              );
      },
    );
  }
}
