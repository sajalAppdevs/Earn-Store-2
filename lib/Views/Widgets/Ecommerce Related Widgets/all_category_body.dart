import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/all_category_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Ecommerce%20Related%20Pages/sub_category_page.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllCategoryBody extends StatelessWidget {
  const AllCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    AllCategoryController controller = Get.put(
      AllCategoryController(),
    );
    return Obx(
      () {
        return PaddedScreen(
          padding: 10.w,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 0.5,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
            ),
            itemCount: controller.categories.value!.client!.mainCat!.length,
            itemBuilder: (BuildContext context, int index) {
              return categoryBox(index: index);
            },
          ),
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
        return GlassmorphismCard(
          horizontalPadding: 10.w,
          onPressed: () {
            Get.to(
              SubCategoryPage(
                mainCatID: controller
                    .categories.value!.client!.mainCat![index].mainCatId
                    .toString(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80.w,
                child: TextStyles.customText(
                  title: controller
                      .categories.value!.client!.mainCat![index].mainCatName
                      .toString(),
                  fontSize: 10.sp,
                  isShowAll: true,
                  textAlign: TextAlign.left,
                ),
              ),
              NetworkImageWidget(
                imageUrl: controller
                    .categories.value!.client!.mainCat![index].mainCatImageUrl
                    .toString(),
                height: 60.h,
                width: 60.w,
              ),
            ],
          ),
        );
      },
    );
  }
}
