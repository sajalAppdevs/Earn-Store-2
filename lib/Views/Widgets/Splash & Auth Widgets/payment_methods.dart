import 'package:earn_store/Controllers/Splash%20&%20Auth%20Controllers/payment_controller.dart';
import 'package:earn_store/Utils/dummy_data.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentController paymentController = Get.put(PaymentController());
    return Obx(
      () {
        return Column(
          children: List.generate(DummyData.paymentMethods.length, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: paymentController.methodIndex.value == index
                  ? glassMethod(index: index)
                  : nonGlassMethod(index: index),
            );
          }),
        );
      },
    );
  }

  Widget nonGlassMethod({required int index}) {
    PaymentController paymentController = Get.put(PaymentController());
    return GestureDetector(
      onTap: () {
        paymentController.changeMethodIndex(index: index);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              DummyData.paymentMethods[index].imagePath,
              height: DummyData.paymentMethods[index].height,
              width: DummyData.paymentMethods[index].width,
              fit: BoxFit.fill,
            ),
            TextStyles.customText(
              title: DummyData.paymentMethods[index].name,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }

  Widget glassMethod({required int index}) {
    PaymentController paymentController = Get.put(PaymentController());
    return GlassmorphismCard(
      boxHeight: 50.h,
      horizontalPadding: 10.w,
      onPressed: () {
        paymentController.changeMethodIndex(index: index);
      },
      childAlignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            DummyData.paymentMethods[index].imagePath,
            height: DummyData.paymentMethods[index].height,
            width: DummyData.paymentMethods[index].width,
            fit: BoxFit.fill,
          ),
          TextStyles.customText(
            title: DummyData.paymentMethods[index].name,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}
