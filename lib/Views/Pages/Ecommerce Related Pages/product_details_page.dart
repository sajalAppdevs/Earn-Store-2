import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/add_to_cart_controller.dart';
import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/product_details_controller.dart';
import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/user_cart_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Ecommerce%20Related%20Widgets/ecommerce_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productID;
  const ProductDetailsPage({
    super.key,
    required this.productID,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ProductDetailsController controller = Get.put(
    ProductDetailsController(),
  );
  UserCartController userCartController = Get.put(
    UserCartController(),
  );
  AddToCartController addToCartController = Get.put(
    AddToCartController(),
  );
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getProductDetails(productID: widget.productID);
    await userCartController.geUserCart();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.productLoading.value ||
                userCartController.cartLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const EcommerceTop(title: "Product Details"),
                    PaddedScreen(
                      child: CustomField(
                        hintText: "Search",
                        controller: TextEditingController(),
                        suffixIcon: Icons.search,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    productImage(),
                    PaddedScreen(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.h),
                          productName(),
                          SizedBox(height: 15.h),
                          customText(title: "Category : Fruits"),
                          SizedBox(height: 15.h),
                          customText(
                            title:
                                "Product ID : ${controller.productDetails.value!.client!.productInfo![0].productId}",
                          ),
                          SizedBox(height: 15.h),
                          locationWidget(),
                          SizedBox(height: 30.h),
                          productDescriptionTitle(),
                          SizedBox(height: 15.h),
                          TextStyles.customText(
                            title: controller.productDetails.value!.client!
                                .productInfo![0].productDetailsDes
                                .toString(),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            isShowAll: true,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 30.h),
                          addCartButton(),
                          SizedBox(height: 50.h),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  Widget productImage() {
    return Obx(
      () {
        return PaddedScreen(
          padding: 30.w,
          child: GlassmorphismCard(
            boxHeight: 200.h,
            boxWidth: 300.w,
            child:
                controller.productDetails.value!.client!.productImages!.isEmpty
                    ? NetworkImageWidget(
                        imageUrl: "",
                        height: 170.h,
                        width: 270.w,
                      )
                    : NetworkImageWidget(
                        imageUrl: controller.productDetails.value!.client!
                            .productImages![0].productImageUrl
                            .toString(),
                        height: 170.h,
                        width: 270.w,
                      ),
          ),
        );
      },
    );
  }

  Widget productName() {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(
              title: controller
                  .productDetails.value!.client!.productInfo![0].productName
                  .toString(),
            ),
            TextStyles.customText(
              title:
                  "BDT : ${controller.productDetails.value!.client!.productInfo![0].productPrice.toString()}",
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
            ),
          ],
        );
      },
    );
  }

  Widget customText({required String title}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextStyles.customText(
        title: title,
        fontSize: 15.sp,
      ),
    );
  }

  Widget locationWidget() {
    return Row(
      children: [
        Image.asset(
          "${Paths.iconPath}location.png",
          height: 20.h,
          width: 18.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 5.w),
        TextStyles.customText(
          title: "4km",
          fontSize: 14.sp,
        )
      ],
    );
  }

  Widget productDescriptionTitle() {
    return customText(title: "Product Description");
  }

  Widget addCartButton() {
    AddToCartController addToCartController = Get.put(AddToCartController());
    return Obx(
      () {
        return addToCartController.addToCartLoading.value
            ? const ButtonLoading()
            : CustomButton(
                onPressed: () {
                  addToCartController.addToCart(
                    productID: controller
                        .productDetails.value!.client!.productInfo![0].productId
                        .toString(),
                    productPrice: controller.productDetails.value!.client!
                        .productInfo![0].productPrice
                        .toString(),
                  );
                },
                buttonText: "Add to Cart",
              );
      },
    );
  }
}
