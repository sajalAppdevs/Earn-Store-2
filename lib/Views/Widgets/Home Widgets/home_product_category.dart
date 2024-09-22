import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/all_category_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Ecommerce%20Related%20Pages/sub_category_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text2.dart';
import 'package:earn_store/Views/Pages/Ecommerce%20Related%20Pages/all_category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeProductCategory extends StatelessWidget {
  const HomeProductCategory({super.key});

  @override
  Widget build(BuildContext context) {
    AllCategoryController controller = Get.put(
      AllCategoryController(),
    );
    return Obx(
      () {
        return controller.categoryLoading.value
            ? ButtonLoading(
                verticalPadding: 50.h,
              )
            : Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  TitleText2(
                    title: "Category",
                    onPressed: () {
                      Get.to(
                        const AllCategoryPage(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        controller.categories.value!.client!.mainCat!.length,
                        (index) => categoryBox(index: index),
                      ),
                    ),
                  )
                ],
              );
      },
    );
  }

  Widget categoryBox({required int index}) {
    AllCategoryController controller = Get.put(
      AllCategoryController(),
    );
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: GlassmorphismCard(
            boxHeight: 75.h,
            boxWidth: 80.w,
            onPressed: () {
              Get.to(
                SubCategoryPage(
                  mainCatID: controller
                      .categories.value!.client!.mainCat![index].mainCatId
                      .toString(),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NetworkImageWidget(
                  imageUrl: controller
                      .categories.value!.client!.mainCat![index].mainCatImageUrl
                      .toString(),
                  height: 25.h,
                  width: 25.w,
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 60.w,
                  child: TextStyles.customText(
                    title: controller
                        .categories.value!.client!.mainCat![index].mainCatName
                        .toString(),
                    fontSize: 8.sp,
                    isShowAll: true,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
