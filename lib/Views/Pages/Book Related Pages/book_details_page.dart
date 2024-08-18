import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CustomTop(title: "Book Detail"),
            SizedBox(height: 20.h),
            bookImage(),
            SizedBox(height: 20.h),
            bookNameAndAuthor(),
            SizedBox(height: 30.h),
            authorWidget(),
            SizedBox(height: 30.h),
            overviewWidget(),
          ],
        ),
      ),
    );
  }

  Widget bookImage() {
    return Container(
      height: 250.h,
      width: 160.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: const DecorationImage(
          image: AssetImage(
            "${Paths.imagePath}book.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget bookNameAndAuthor() {
    return Column(
      children: [
        TextStyles.customText(
          title: "Catcher in the Rye",
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        TextStyles.customText(
          title: "J.D. Salinger",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  Widget authorWidget() {
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
            title:
                "J.D. Salinger was an American writer, best known for his 1951 novel The Catcher in the Rye. Before its public cation, Salinger published several short stories in Story magazine",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            isShowAll: true,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget overviewWidget() {
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
                "The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            isShowAll: true,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
