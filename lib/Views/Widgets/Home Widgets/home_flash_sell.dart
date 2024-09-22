import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/flash_sell_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Pages/Ecommerce%20Related%20Pages/product_details_page.dart';
import 'package:earn_store/Views/Styles/title_text2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeFlashSell extends StatelessWidget {
  const HomeFlashSell({super.key});

  @override
  Widget build(BuildContext context) {
    FlashSellController controller = Get.put(FlashSellController());
    return Obx(
      () {
        return controller.flashLoading.value
            ? ButtonLoading(
                verticalPadding: 50.h,
              )
            : Column(
                key: key,
                children: [
                  const TitleText2(
                    title: "Flash Sale",
                    hideAll: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        controller
                            .flashSells.value!.client!.productInfo!.length,
                        (index) => imageBox(index: index),
                      ),
                    ),
                  )
                ],
              );
      },
    );
  }

  Widget imageBox({required int index}) {
    FlashSellController controller = Get.put(FlashSellController());
    return Obx(
      () {
        return GestureDetector(
          onTap: () {
            Get.to(ProductDetailsPage(
              productID: controller
                  .flashSells.value!.client!.productInfo![index].productId
                  .toString(),
            ));
          },
          child: CachedNetworkImage(
            imageUrl: controller.flashSells.value!.client!.productInfo![index]
                .productImages![0].productImageUrl
                .toString(),
            imageBuilder: (context, imageProvider) => Container(
              height: 105.h,
              width: 180.w,
              margin: EdgeInsets.only(
                right: 10.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            placeholder: (context, url) => const ButtonLoading(),
            errorWidget: (context, url, error) => Container(
              height: 105.h,
              width: 180.w,
              margin: EdgeInsets.only(
                right: 10.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: Colors.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}
