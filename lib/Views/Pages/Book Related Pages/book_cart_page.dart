import 'package:earn_store/Controllers/Book%20Related%20Controllers/book_cart_controller.dart';
import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/delivery_area_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Book%20Related%20Widgets/book_cart_bottom.dart';
import 'package:earn_store/Views/Widgets/Book%20Related%20Widgets/book_list_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCartPage extends StatefulWidget {
  const BookCartPage({
    super.key,
  });

  @override
  State<BookCartPage> createState() => _BookCartPageState();
}

class _BookCartPageState extends State<BookCartPage> {
  BookCartController controller = Get.put(
    BookCartController(),
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
                    BookListCart(),
                    BookCartBottom(),
                  ],
                ),
              );
      },
    );
  }
}
