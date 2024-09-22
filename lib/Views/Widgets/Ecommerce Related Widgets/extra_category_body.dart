import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/product_by_category_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Ecommerce%20Related%20Pages/product_details_page.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExtraCategoryBody extends StatelessWidget {
  const ExtraCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProductByCategoryController controller = Get.put(
      ProductByCategoryController(),
    );
    return Obx(
      () {
        return controller.productLoading.value
            ? ButtonLoading(
                verticalPadding: 220.h,
              )
            : PaddedScreen(
                padding: 10.w,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller
                      .productsByCategory.value!.client!.productInfo!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return productBox(index: index);
                  },
                ),
              );
      },
    );
  }

  Widget productBox({required int index}) {
    ProductByCategoryController controller = Get.put(
      ProductByCategoryController(),
    );
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: GlassmorphismCard(
            boxHeight: 65.h,
            boxWidth: Get.width,
            horizontalPadding: 15.w,
            onPressed: () {
              Get.to(
                ProductDetailsPage(
                  productID: controller.productsByCategory.value!.client!
                      .productInfo![index].productId
                      .toString(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    controller.productsByCategory.value!.client!
                            .productInfo![index].featuredImages!.isEmpty
                        ? NetworkImageWidget(
                            loadingSize: 15.sp,
                            imageUrl: "",
                            height: 30.h,
                            width: 30.w,
                          )
                        : NetworkImageWidget(
                            loadingSize: 15.sp,
                            imageUrl: controller
                                .productsByCategory
                                .value!
                                .client!
                                .productInfo![index]
                                .featuredImages![0]
                                .productImageUrl
                                .toString(),
                            height: 30.h,
                            width: 30.w,
                          ),
                    SizedBox(width: 10.w),
                    SizedBox(
                      width: 240.w,
                      child: TextStyles.customText(
                        title: controller.productsByCategory.value!.client!
                            .productInfo![index].productName
                            .toString(),
                        fontSize: 15.sp,
                        isShowAll: true,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                goBox(index: index),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget goBox({required int index}) {
    return Container(
      height: 25.h,
      width: 25.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: TextColors.textColor1,
          width: 1.w,
        ),
      ),
      child: Icon(
        Icons.arrow_forward,
        color: TextColors.textColor1,
        size: 15.sp,
      ),
    );
  }
}
