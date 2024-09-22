import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/all_category_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Ecommerce%20Related%20Pages/extra_category_page.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubCategoryBody extends StatelessWidget {
  final String mainCatID;
  const SubCategoryBody({super.key, required this.mainCatID});

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
            itemCount: controller.categories.value!.client!.subCat!.length,
            itemBuilder: (BuildContext context, int index) {
              return controller
                          .categories.value!.client!.subCat![index].subCatRef ==
                      mainCatID
                  ? categoryBox(index: index)
                  : Container();
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
              ExtraCategoryPage(
                subCatID: controller
                    .categories.value!.client!.subCat![index].subCatId
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
                      .categories.value!.client!.subCat![index].subCatName
                      .toString(),
                  fontSize: 10.sp,
                  isShowAll: true,
                  textAlign: TextAlign.left,
                ),
              ),
              NetworkImageWidget(
                imageUrl: controller
                    .categories.value!.client!.subCat![index].subCatImageUrl
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
