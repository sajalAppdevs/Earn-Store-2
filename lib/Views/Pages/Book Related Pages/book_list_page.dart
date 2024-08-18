import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Book%20Related%20Pages/book_details_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Books"),
          SizedBox(height: 20.h),
          PaddedScreen(
            padding: 15.w,
            child: Column(
              children: [
                bookList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bookList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.6,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 5.w,
      ),
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GlassmorphismCard(
          onPressed: () {
            Get.to(
              const BookDetailsPage(),
            );
          },
          child: Column(
            children: [
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: const DecorationImage(
                    image: AssetImage(
                      "${Paths.imagePath}book.jpg",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              PaddedScreen(
                padding: 5.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h),
                    TextStyles.customText(
                      title: "Catcher in the Rye",
                      fontWeight: FontWeight.w400,
                    ),
                    TextStyles.customText(
                      title: "J.D. Salinger",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                    TextStyles.customText(
                      title: "220 BDT",
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
