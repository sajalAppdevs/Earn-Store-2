import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Ecommerce%20Related%20Widgets/ecommerce_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    super.key,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const EcommerceTop(title: "Product Details"),
          PaddedScreen(
            child: CustomField(
              hintText: "Search",
              controller: TextEditingController(),
              suffixIcon: Icons.search,
            ),
          ),
          SizedBox(height: 30.h),
          productImage(),
          PaddedScreen(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                productName(),
                SizedBox(height: 15.h),
                customText(title: "Category : Fruits"),
                SizedBox(height: 15.h),
                customText(title: "Product ID : hgfy2ww5"),
                SizedBox(height: 15.h),
                locationWidget(),
                SizedBox(height: 30.h),
                productDescriptionTitle(),
                SizedBox(height: 15.h),
                TextStyles.customText(
                  title:
                      "The Fruit Bowl is a simple bowl full of seasonal fruits chopped to bite size. This is a bowl full of healthy ingredients like Strawberries,  Green Grapes,  Orange , peeled, chopped coarsely",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  isShowAll: true,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 30.h),
                buttonRow(),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productImage() {
    return PaddedScreen(
      padding: 30.w,
      child: GlassmorphismCard(
        boxHeight: 200.h,
        boxWidth: 300.w,
        child: Image.asset(
          "${Paths.imagePath}product.jpg",
          height: 170.h,
          width: 270.w,
        ),
      ),
    );
  }

  Widget productName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(title: "Fresh Vegetables"),
        TextStyles.customText(
          title: "BDT : 120.00",
          fontWeight: FontWeight.w700,
          fontSize: 15.sp,
        ),
      ],
    );
  }

  Widget customText({required String title}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextStyles.customText(
        title: title,
        fontSize: 15.sp,
      ),
    );
  }

  Widget locationWidget() {
    return Row(
      children: [
        Image.asset(
          "${Paths.iconPath}location.png",
          height: 20.h,
          width: 18.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 5.w),
        TextStyles.customText(
          title: "4km",
          fontSize: 14.sp,
        )
      ],
    );
  }

  Widget productDescriptionTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(title: "Product Description"),
        CustomButton(
          height: 35.h,
          width: 120.w,
          onPressed: () {},
          buttonText: "Check Reviews",
          textSize: 10.sp,
        )
      ],
    );
  }

  Widget buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          width: 150.w,
          onPressed: () {},
          buttonText: "Add to Cart",
        ),
        CustomButton(
          width: 150.w,
          onPressed: () {},
          buttonText: "Refer",
        ),
      ],
    );
  }
}
