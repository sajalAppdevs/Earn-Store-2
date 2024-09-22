import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/all_product_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Ecommerce%20Related%20Pages/product_details_page.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EcommerceProductList extends StatelessWidget {
  const EcommerceProductList({super.key});

  @override
  Widget build(BuildContext context) {
    AllProductController controller = Get.put(AllProductController());
    return Obx(
      () {
        return PaddedScreen(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topRow(),
              SizedBox(height: 20.h),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 1 / 1.25,
                ),
                itemCount:
                    controller.allProducts.value!.client!.productInfo!.length,
                itemBuilder: (BuildContext context, int index) {
                  return productBox(index: index);
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }

  Widget topRow() {
    return TextStyles.customText(
      title: "Products",
    );
  }

  Widget productBox({required int index}) {
    AllProductController controller = Get.put(AllProductController());
    return Obx(
      () {
        return GlassmorphismCard(
          verticalPadding: 10.h,
          onPressed: () {
            Get.to(
              ProductDetailsPage(
                productID: controller
                    .allProducts.value!.client!.productInfo![index].productId
                    .toString(),
              ),
            );
          },
          child: Column(
            children: [
              controller.allProducts.value!.client!.productInfo![index]
                      .featuredImages!.isEmpty
                  ? NetworkImageWidget(
                      imageUrl: "",
                      height: 100.h,
                      width: 120.w,
                      loadingSize: 18.sp,
                      verticalPaddingForLoading: 30.h,
                    )
                  : NetworkImageWidget(
                      imageUrl: controller
                          .allProducts
                          .value!
                          .client!
                          .productInfo![index]
                          .featuredImages![0]
                          .productImageUrl
                          .toString(),
                      height: 100.h,
                      width: 120.w,
                      loadingSize: 18.sp,
                      verticalPaddingForLoading: 30.h,
                    ),
              SizedBox(height: 5.h),
              TextStyles.customText(
                title: controller
                    .allProducts.value!.client!.productInfo![index].productName
                    .toString(),
                fontSize: 13.sp,
              ),
              SizedBox(height: 5.h),
              TextStyles.customText(
                title:
                    "BDT ${controller.allProducts.value!.client!.productInfo![index].productPrice.toString()}",
                fontSize: 13.sp,
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "${Paths.iconPath}location.png",
                    height: 15.h,
                    width: 15.w,
                  ),
                  SizedBox(width: 4.w),
                  TextStyles.customText(
                    title: "3.21 km",
                    fontSize: 13.sp,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
