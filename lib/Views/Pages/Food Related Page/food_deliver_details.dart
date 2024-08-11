import 'package:earn_store/Controllers/Food%20Related%20Controllers/food_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Pages/Food%20Related%20Page/food_list.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Food%20Related%20Widgets/food_delivery_details_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodDeliveryDetails extends StatefulWidget {
  final String restaurantID;
  final String imagePath;
  const FoodDeliveryDetails({
    super.key,
    required this.restaurantID,
    required this.imagePath,
  });

  @override
  State<FoodDeliveryDetails> createState() => _FoodDeliveryDetailsState();
}

class _FoodDeliveryDetailsState extends State<FoodDeliveryDetails> {
  FoodController controller = Get.put(FoodController());
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getFoods(restaurantID: widget.restaurantID);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.foodLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    FoodDeliveryDetailsTop(
                      imagePath: widget.imagePath,
                    ),
                    PaddedScreen(
                      child: CustomField(
                        hintText: "Search",
                        controller: searchController,
                        suffixIcon: Icons.search,
                        onPressed: (value) {
                          controller.filterFood(
                            value: searchController.text,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30.h),
                    const FoodList()
                  ],
                ),
              );
      },
    );
  }
}
