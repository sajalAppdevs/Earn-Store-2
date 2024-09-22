import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/delivery_area_controller.dart';
import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/user_cart_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Ecommerce%20Related%20Widgets/product_cart_bottom.dart';
import 'package:earn_store/Views/Widgets/Ecommerce%20Related%20Widgets/product_list_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCartPage extends StatefulWidget {
  const ProductCartPage({
    super.key,
  });

  @override
  State<ProductCartPage> createState() => _ProductCartPageState();
}

class _ProductCartPageState extends State<ProductCartPage> {
  UserCartController controller = Get.put(
    UserCartController(),
  );
  DeliveryAreaController deliveryAreaController =
      Get.put(DeliveryAreaController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    deliveryAreaController.setDeliveryEmpty();
    await deliveryAreaController.getDeliveryArea();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.cartLoading.value ||
                deliveryAreaController.areaLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    CustomTop(
                      title: "My Cart",
                    ),
                    ProductListCart(),
                    ProductCartBottom(),
                  ],
                ),
              );
      },
    );
  }
}
