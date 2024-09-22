import 'package:earn_store/Controllers/Book%20Related%20Controllers/book_cart_controller.dart';
import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/user_cart_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Ecommerce%20Related%20Widgets/delivery_area_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookCartBottom extends StatelessWidget {
  const BookCartBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      padding: 10.w,
      child: Column(
        children: [
          SizedBox(height: 15.h),
          subTotalPrice(),
          SizedBox(height: 15.h),
          areaSelector(),
          SizedBox(height: 10.h),
          customDivider(),
          SizedBox(height: 10.h),
          totalPrice(),
          SizedBox(height: 70.h),
          CustomButton(
            buttonText: "Proceed Checkout",
            onPressed: () {
              Snackbars.successSnackBar(
                title: "Order Place Status",
                description: "Order Placed To Admin",
              );
              Get.offAll(
                const RootScreen(),
              );
            },
          ),
          SizedBox(height: 70.h),
        ],
      ),
    );
  }

  Widget subTotalPrice() {
    BookCartController controller = Get.put(
      BookCartController(),
    );
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextStyles.customText(
              title: "Sub Total",
            ),
            TextStyles.customText(
              title: "${controller.subTotal.value}.00৳",
            ),
          ],
        );
      },
    );
  }

  Widget areaSelector() {
    UserCartController controller = Get.put(
      UserCartController(),
    );
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DeliveryAreaSelector(),
            TextStyles.customText(
              title: "${controller.deliveryCharge.value}.00৳",
            ),
          ],
        );
      },
    );
  }

  Widget customDivider() {
    return Divider(
      color: TextColors.textColor1,
      thickness: 1.h,
    );
  }

  Widget totalPrice() {
    BookCartController controller = Get.put(
      BookCartController(),
    );
    UserCartController userCartController = Get.put(
      UserCartController(),
    );
    return Obx(
      () {
        int total =
            controller.subTotal.value + userCartController.deliveryCharge.value;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextStyles.customText(
              title: "Total",
            ),
            TextStyles.customText(
              title: "$total.00৳",
            ),
          ],
        );
      },
    );
  }
}
