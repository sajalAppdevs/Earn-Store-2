import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/cart_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Ecommerce%20Related%20Widgets/product_cart_bottom.dart';
import 'package:earn_store/Views/Widgets/Ecommerce%20Related%20Widgets/product_list_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductCartPage extends StatefulWidget {
  const ProductCartPage({
    super.key,
  });

  @override
  State<ProductCartPage> createState() => _ProductCartPageState();
}

class _ProductCartPageState extends State<ProductCartPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(
            title: "My Cart",
          ),
          selectAllWidget(),
          const ProductListCart(),
          const ProductCartBottom(),
        ],
      ),
    );
  }

  Widget selectAllWidget() {
    CartController controller = Get.put(CartController());
    return Obx(
      () {
        return Row(
          children: [
            Checkbox(
              value: controller.selectAll.value,
              onChanged: (value) {
                controller.changeSelectAll();
              },
            ),
            TextStyles.customText(
              title: "Select All",
              fontSize: 18.sp,
            )
          ],
        );
      },
    );
  }
}
