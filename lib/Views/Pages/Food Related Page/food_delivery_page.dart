import 'package:earn_store/Controllers/Food%20Related%20Controllers/restaurant_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Food%20Related%20Page/food_deliver_details.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodDeliveryPage extends StatefulWidget {
  const FoodDeliveryPage({super.key});

  @override
  State<FoodDeliveryPage> createState() => _FoodDeliveryPageState();
}

class _FoodDeliveryPageState extends State<FoodDeliveryPage> {
  RestaurantController controller = Get.put(RestaurantController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.restaurantLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CustomTop(title: "Food Delivery"),
                    SizedBox(height: 20.h),
                    onlineFoodDeliveries(),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
      },
    );
  }

  Widget onlineFoodDeliveries() {
    return Obx(
      () {
        return PaddedScreen(
          child: GridView.builder(
            itemCount: controller.restaurants.value!.restautants!.length,
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
                    FoodDeliveryDetails(
                      restaurantID: controller
                          .restaurants.value!.restautants![index].id
                          .toString(),
                      imagePath: controller
                          .restaurants.value!.restautants![index].image
                          .toString(),
                    ),
                  );
                },
                child: NetworkImageWidget(
                  imageUrl: controller
                      .restaurants.value!.restautants![index].image
                      .toString(),
                  height: 26.h,
                  width: 130.w,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
