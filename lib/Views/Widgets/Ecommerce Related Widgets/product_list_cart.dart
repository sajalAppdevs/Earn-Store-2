import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/user_cart_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductListCart extends StatelessWidget {
  const ProductListCart({super.key});

  @override
  Widget build(BuildContext context) {
    UserCartController controller = Get.put(
      UserCartController(),
    );
    return Obx(
      () {
        return PaddedScreen(
          padding: 10.w,
          child: ListView.builder(
            itemCount: controller.carts.value!.client!.cartInfo!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return productBox(index: index);
            },
          ),
        );
      },
    );
  }

  Widget productBox({required int index}) {
    UserCartController controller = Get.put(
      UserCartController(),
    );
    return Obx(
      () {
        return controller.loadingIndex.value == index &&
                controller.updateCartLoading.value
            ? ButtonLoading(
                verticalPadding: 50.h,
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                child: GlassmorphismCard(
                  boxHeight: 130.h,
                  boxWidth: 330.w,
                  verticalPadding: 10.h,
                  horizontalPadding: 10.w,
                  child: Row(
                    children: [
                      productImage(index: index),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          nameAndPrice(index: index),
                          SizedBox(height: 10.h),
                          quantityBox(index: index),
                        ],
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }

  Widget productImage({required int index}) {
    UserCartController controller = Get.put(
      UserCartController(),
    );
    return Obx(
      () {
        return NetworkImageWidget(
          imageUrl:
              controller.carts.value!.client!.cartInfo![index].productImage !=
                      null
                  ? controller.carts.value!.client!.cartInfo![index]
                      .productImage!.featuredImageUrl
                      .toString()
                  : "",
          height: 90.h,
          width: 120.w,
        );
      },
    );
  }

  Widget nameAndPrice({required int index}) {
    UserCartController controller = Get.put(
      UserCartController(),
    );
    return Obx(
      () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 185.w,
              child: TextStyles.customText(
                title: controller
                    .carts.value!.client!.cartInfo![index].productName
                    .toString(),
                fontSize: 14.sp,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 5.h),
            TextStyles.customText(
              title:
                  "${controller.carts.value!.client!.cartInfo![index].productTotalPrice.toString()}৳",
              fontSize: 14.sp,
            ),
          ],
        );
      },
    );
  }

  Widget quantityBox({required int index}) {
    UserCartController controller = Get.put(
      UserCartController(),
    );
    return Padding(
      padding: EdgeInsets.only(left: 70.w),
      child: Row(
        children: [
          GlassmorphismCard(
            boxHeight: 35.h,
            boxWidth: 35.w,
            borderRadius: 0,
            onPressed: () {
              controller.decrementQuantity(index: index);
            },
            child: Icon(
              Icons.remove,
              size: 25.sp,
              color: TextColors.textColor1,
            ),
          ),
          SizedBox(width: 5.w),
          GlassmorphismCard(
            boxHeight: 35.h,
            boxWidth: 35.w,
            borderRadius: 0,
            child: TextStyles.customText(
              title: controller
                  .carts.value!.client!.cartInfo![index].productQuantity
                  .toString(),
              fontSize: 22.sp,
            ),
          ),
          SizedBox(width: 5.w),
          GlassmorphismCard(
            boxHeight: 35.h,
            boxWidth: 35.w,
            onPressed: () {
              controller.incrementQuantity(index: index);
            },
            borderRadius: 0,
            child: Icon(
              Icons.add,
              size: 25.sp,
              color: TextColors.textColor1,
            ),
          ),
        ],
      ),
    );
  }
}
