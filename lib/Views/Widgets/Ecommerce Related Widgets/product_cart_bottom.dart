import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCartBottom extends StatelessWidget {
  const ProductCartBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      padding: 10.w,
      child: Column(
        children: [
          SizedBox(height: 15.h),
          subTotalPrice(),
          SizedBox(height: 15.h),
          areaSelector(),
          SizedBox(height: 10.h),
          customDivider(),
          SizedBox(height: 10.h),
          totalPrice(),
          SizedBox(height: 70.h),
          CustomButton(
            buttonText: "Proceed Checkout",
            onPressed: () {},
          ),
          SizedBox(height: 70.h),
        ],
      ),
    );
  }

  Widget subTotalPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextStyles.customText(
          title: "Sub Total",
        ),
        TextStyles.customText(
          title: "120.00৳",
        ),
      ],
    );
  }

  Widget areaSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomField(
          hintText: "Select Area",
          controller: TextEditingController(),
          width: 200.w,
        ),
        TextStyles.customText(
          title: "0.00",
        ),
      ],
    );
  }

  Widget customDivider() {
    return Divider(
      color: TextColors.textColor1,
      thickness: 1.h,
    );
  }

  Widget totalPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextStyles.customText(
          title: "Total",
        ),
        TextStyles.customText(
          title: "120.00৳",
        ),
      ],
    );
  }
}
