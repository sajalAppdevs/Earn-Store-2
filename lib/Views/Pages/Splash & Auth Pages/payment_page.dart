import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/payment_success_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Splash%20&%20Auth%20Widgets/payment_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: PaddedScreen(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 40.h),
            paymentBox(),
            SizedBox(height: 30.h),
            titleText(
              title:
                  "Send Money to 01784286885 Bkash/Nagad\nPersonal Number & Submit",
            ),
            titleText(
              title: "Select Payment Method",
            ),
            const PaymentMethods(),
            paymentFields(),
            SizedBox(height: 30.h),
            CustomButton(
                onPressed: () {
                  Get.to(
                    const PaymentSuccessPage(),
                  );
                },
                buttonText: "Confirm"),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

  Widget paymentBox() {
    return GlassmorphismCard(
      verticalPadding: 15.h,
      horizontalPadding: 20.w,
      boxHeight: 135.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextStyles.customText(
            title: "Payment",
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextStyles.customText(
                title: "Total Fee",
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
              TextStyles.customText(
                title: "185",
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget titleText({required String title}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextStyles.customText(
          title: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget paymentFields() {
    return Column(
      children: [
        SizedBox(height: 20.h),
        CustomField(
          hintText: "Mobile No.",
          controller: TextEditingController(),
        ),
        SizedBox(height: 20.h),
        CustomField(
          hintText: "Transaction Id",
          controller: TextEditingController(),
        ),
        SizedBox(height: 20.h),
        CustomField(
          hintText: "Amount",
          controller: TextEditingController(),
        ),
      ],
    );
  }
}
