import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Book%20Related%20Controllers/book_add_cart_controller.dart';
import 'package:earn_store/Controllers/Book%20Related%20Controllers/book_cart_controller.dart';
import 'package:earn_store/Controllers/Book%20Related%20Controllers/book_details_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Book%20Related%20Widgets/book_details_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookDetailsPage extends StatefulWidget {
  final String bookID;
  const BookDetailsPage({
    super.key,
    required this.bookID,
  });

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  BookDetailsController controller = Get.put(BookDetailsController());
  BookCartController bookCartController = Get.put(
    BookCartController(),
  );
  BookAddToCartController bookAddToCartController =
      Get.put(BookAddToCartController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getBookDetails(bookID: widget.bookID);
    await bookCartController.getBookCart();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.bookLoading.value ||
                bookCartController.cartLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const BookDetailsTop(title: "Book Detail"),
                      SizedBox(height: 20.h),
                      bookImage(),
                      SizedBox(height: 20.h),
                      bookNameAndAuthor(),
                      SizedBox(height: 30.h),
                      authorWidget(),
                      SizedBox(height: 30.h),
                      overviewWidget(),
                      SizedBox(height: 50.h),
                      bookAddToCartController.addToCartLoading.value
                          ? const ButtonLoading()
                          : CustomButton(
                              onPressed: () async {
                                await bookAddToCartController.addToCart(
                                  bookID: controller
                                      .bookDetails.value!.book![0].id
                                      .toString(),
                                  bookPrice: controller
                                      .bookDetails.value!.book![0].price
                                      .toString(),
                                );
                              },
                              buttonText: "Add To Cart",
                            ),
                      SizedBox(height: 70.h),
                    ],
                  ),
                ),
              );
      },
    );
  }

  Widget bookImage() {
    return Obx(
      () {
        return CachedNetworkImage(
          imageUrl: controller.bookDetails.value!.book![0].image.toString(),
          imageBuilder: (context, imageProvider) => Container(
            height: 250.h,
            width: 160.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          placeholder: (context, url) => const ButtonLoading(),
          errorWidget: (context, url, error) => Container(
            height: 250.h,
            width: 160.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }

  Widget bookNameAndAuthor() {
    return Obx(
      () {
        return Column(
          children: [
            TextStyles.customText(
              title: controller.bookDetails.value!.book![0].name.toString(),
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 5.h),
            TextStyles.customText(
              title: controller.bookDetails.value!.book![0].author.toString(),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        );
      },
    );
  }

  Widget authorWidget() {
    return Obx(
      () {
        return PaddedScreen(
          padding: 10.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyles.customText(
                title: "About the author",
                fontSize: 16.sp,
              ),
              SizedBox(height: 15.h),
              TextStyles.customText(
                title: controller.bookDetails.value!.book![0].aboutAuthor
                    .toString(),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                isShowAll: true,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget overviewWidget() {
    return Obx(
      () {
        return PaddedScreen(
          padding: 10.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyles.customText(
                title: "Overview",
                fontSize: 16.sp,
              ),
              SizedBox(height: 10.h),
              TextStyles.customText(
                title:
                    controller.bookDetails.value!.book![0].overview.toString(),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                isShowAll: true,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        );
      },
    );
  }
}
