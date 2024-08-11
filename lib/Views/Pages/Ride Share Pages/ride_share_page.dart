import 'package:earn_store/Controllers/Car%20Controllers/car_shop_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Ride%20Share%20Pages/ride_share_details.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RideSharePage extends StatefulWidget {
  const RideSharePage({super.key});

  @override
  State<RideSharePage> createState() => _RideSharePageState();
}

class _RideSharePageState extends State<RideSharePage> {
  CarShopController controller = Get.put(CarShopController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getCarShop();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.carShopLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CustomTop(title: "Ride Sharing Apps"),
                    SizedBox(height: 20.h),
                    rideShareApps(),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
      },
    );
  }

  Widget rideShareApps() {
    return Obx(
      () {
        return PaddedScreen(
          child: GridView.builder(
            itemCount: controller.carShops.value!.carShop!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h,
              childAspectRatio: 1 / 0.5,
            ),
            itemBuilder: (context, index) {
              return GlassmorphismCard(
                onPressed: () {
                  Get.to(
                    RideShareDetails(
                      shopID: controller.carShops.value!.carShop![index].id
                          .toString(),
                      imagePath: controller
                          .carShops.value!.carShop![index].image
                          .toString(),
                    ),
                  );
                },
                child: NetworkImageWidget(
                  imageUrl: controller.carShops.value!.carShop![index].image
                      .toString(),
                  height: 40.h,
                  width: 88.w,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
