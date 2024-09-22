import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Book%20Related%20Controllers/book_by_category_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Book%20Related%20Pages/book_details_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookListPage extends StatefulWidget {
  final String categoryID;
  const BookListPage({
    super.key,
    required this.categoryID,
  });

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  BookByCategoryController controller = Get.put(BookByCategoryController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getBooksByCategories(categoryID: widget.categoryID);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.bookLoading.value
            ? const ScreenLoading()
            : RootDesign(
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
      },
    );
  }

  Widget bookList() {
    return Obx(
      () {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.6,
            mainAxisSpacing: 20.h,
            crossAxisSpacing: 5.w,
          ),
          itemCount: controller.books.value!.books!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GlassmorphismCard(
              onPressed: () {
                Get.to(
                  BookDetailsPage(
                    bookID: controller.books.value!.books![index].id.toString(),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        controller.books.value!.books![index].image.toString(),
                    imageBuilder: (context, imageProvider) => Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        ButtonLoading(verticalPadding: 70.h),
                    errorWidget: (context, url, error) => Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.grey,
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
                          title: controller.books.value!.books![index].name
                              .toString(),
                          fontWeight: FontWeight.w400,
                        ),
                        TextStyles.customText(
                          title: controller.books.value!.books![index].author
                              .toString(),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                        TextStyles.customText(
                          title:
                              "BDT: ${controller.books.value!.books![index].price}",
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
      },
    );
  }
}
