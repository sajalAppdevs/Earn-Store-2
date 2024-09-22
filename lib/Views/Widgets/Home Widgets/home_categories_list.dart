import 'dart:ui';

import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/all_category_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/dummy_data.dart';
import 'package:earn_store/Views/Pages/Ecommerce%20Related%20Pages/ecommerce_page.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({
    super.key,
  });

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
            : Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                child: Column(
                  children: [
                    const TitleText(
                      title: "Categories",
                      hideAll: true,
                    ),
                    SizedBox(height: 10.h),
                    categories(),
                  ],
                ),
              );
      },
    );
  }

  Widget categories() {
    return Row(
      children: List.generate(
        DummyData.homeCategories.length,
        (index) {
          return GestureDetector(
            onTap: index == 1
                ? () {
                    Get.to(
                      const EcommercePage(),
                    );
                  }
                : () {},
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    height: 35.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 30.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: GlassMorphismColors.glassColor1,
                      boxShadow: [
                        BoxShadow(
                          color: GeneralColors.shadowColor1.withOpacity(0.26),
                          blurRadius: 2,
                          spreadRadius: 0,
                          offset: const Offset(1.18, 1.18),
                        ),
                        BoxShadow(
                          color: GeneralColors.blackColor.withOpacity(0.30),
                          blurRadius: 2,
                          spreadRadius: 0,
                          offset: const Offset(-1.18, -1.18),
                        ),
                      ],
                    ),
                    child: TextStyles.customText(
                      title: DummyData.homeCategories[index],
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
