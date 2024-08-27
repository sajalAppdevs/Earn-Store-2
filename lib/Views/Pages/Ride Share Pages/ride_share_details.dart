import 'package:earn_store/Controllers/Car%20Controllers/car_by_shop_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Ride%20Share%20Widgets/ride_share_details_top.dart';
import 'package:earn_store/Views/Widgets/Ride%20Share%20Widgets/ride_share_recommended.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RideShareDetails extends StatefulWidget {
  final String imagePath;
  final String shopID;
  const RideShareDetails({
    super.key,
    required this.shopID,
    required this.imagePath,
  });

  @override
  State<RideShareDetails> createState() => _RideShareDetailsState();
}

class _RideShareDetailsState extends State<RideShareDetails> {
  CarByShopController controller = Get.put(CarByShopController());
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getCars(shopID: widget.shopID);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.carLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    RideShareDetailsTop(
                      imagePath: widget.imagePath,
                    ),
                    PaddedScreen(
                      child: CustomField(
                        hintText: "Search",
                        controller: searchController,
                        suffixIcon: Icons.search,
                        onPressed: (value) {
                          controller.filterCar(
                            value: searchController.text,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30.h),
                    // const RideVehicleSelector(),
                    SizedBox(height: 30.h),
                    const RideShareRecommended()
                  ],
                ),
              );
      },
    );
  }
}
