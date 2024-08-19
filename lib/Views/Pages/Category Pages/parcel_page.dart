import 'package:earn_store/Controllers/Home%20Controllers/parcel_delivery_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Category%20Widgets/parcel_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParcelPage extends StatefulWidget {
  const ParcelPage({super.key});

  @override
  State<ParcelPage> createState() => _ParcelPageState();
}

class _ParcelPageState extends State<ParcelPage> {
  ParcelDeliveryController controller = Get.put(
    ParcelDeliveryController(),
  );
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getAllParcelDelivery();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.parcelLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    CustomTop(title: "Parcel"),
                    ParcelBox(),
                  ],
                ),
              );
      },
    );
  }
}
