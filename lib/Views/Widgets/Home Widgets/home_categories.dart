import 'package:earn_store/Controllers/Home%20Controllers/home_categories_controller.dart';
import 'package:earn_store/Utils/dummy_data.dart';
import 'package:earn_store/Views/Common%20Widgets/rounded_button.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeCategoriesController controller = Get.put(HomeCategoriesController());
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: DummyData.homeCategories2.length,
      itemBuilder: (context, index) {
        String imagePath = DummyData.homeCategories2[index].imagePath;
        double imageHeight = DummyData.homeCategories2[index].height;
        double imageWidth = DummyData.homeCategories2[index].height;
        String title = DummyData.homeCategories2[index].name;
        return Column(
          children: [
            RoundedButton(
              onPressed: () {
                controller.categoriesNavigator(
                  index: index,
                );
              },
              child: Image.asset(
                imagePath,
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 5.h),
            GestureDetector(
              onTap: () {
                controller.categoriesNavigator(
                  index: index,
                );
              },
              child: TextStyles.customText(
                title: title,
                fontSize: 12.sp,
              ),
            )
          ],
        );
      },
    );
  }
}
