import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Book%20Related%20Pages/book_list_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookCategoryPage extends StatelessWidget {
  const BookCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return RootDesign(
      child: PaddedScreen(
        padding: 15.w,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 20.h),
            CustomField(
              hintText: "Search",
              controller: searchController,
              suffixIcon: Icons.search,
            ),
            SizedBox(height: 20.h),
            TitleText2(
              title: "All Categories",
              fontSize: 14.sp,
            ),
            SizedBox(height: 30.h),
            categoryList()
          ],
        ),
      ),
    );
  }

  Widget categoryList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 0.5,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.w,
      ),
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GlassmorphismCard(
          onPressed: () {
            Get.to(
              const BookListPage(),
            );
          },
          child: TextStyles.customText(
            title: "Computer Programming",
            isShowAll: true,
            fontSize: 15.sp,
          ),
        );
      },
    );
  }
}
