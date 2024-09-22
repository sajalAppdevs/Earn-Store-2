import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/all_category_controller.dart';
import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/product_by_category_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Ecommerce%20Related%20Widgets/extra_category_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExtraCategoryPage extends StatefulWidget {
  final String subCatID;
  const ExtraCategoryPage({
    super.key,
    required this.subCatID,
  });

  @override
  State<ExtraCategoryPage> createState() => _ExtraCategoryPageState();
}

class _ExtraCategoryPageState extends State<ExtraCategoryPage> {
  AllCategoryController controller = Get.put(
    AllCategoryController(),
  );
  ProductByCategoryController productByCategoryController = Get.put(
    ProductByCategoryController(),
  );
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    String firstExtraCatID = "";
    for (var element in controller.categories.value!.client!.extraCat!) {
      if (element.extraCatRef == widget.subCatID) {
        firstExtraCatID = element.extraCatId.toString();
        debugPrint(element.extraCatName);
        break;
      }
    }

    await productByCategoryController.getProductByCategory(
      categoryID: firstExtraCatID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(
            title: "Extra Category",
          ),
          PaddedScreen(
            padding: 10.w,
            child: CustomField(
              hintText: "Search",
              controller: TextEditingController(),
              suffixIcon: Icons.search,
            ),
          ),
          SizedBox(height: 15.h),
          extraCategories(),
          SizedBox(height: 15.h),
          const ExtraCategoryBody(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget extraCategories() {
    AllCategoryController controller = Get.put(
      AllCategoryController(),
    );
    return Obx(
      () {
        return PaddedScreen(
          padding: 10.w,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                controller.categories.value!.client!.extraCat!.length,
                (index) {
                  return controller.categories.value!.client!.extraCat![index]
                              .extraCatRef ==
                          widget.subCatID
                      ? categoryBox(index: index)
                      : Container();
                },
              ),
            ),
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
        return Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: GlassmorphismCard(
            boxHeight: 75.h,
            boxWidth: 80.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NetworkImageWidget(
                  loadingSize: 15.sp,
                  imageUrl: controller.categories.value!.client!
                      .extraCat![index].extraCatImageUrl
                      .toString(),
                  height: 25.h,
                  width: 25.w,
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 60.w,
                  child: TextStyles.customText(
                    title: controller
                        .categories.value!.client!.extraCat![index].extraCatName
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
