import 'package:earn_store/Controllers/User%20Controllers/withdraw_history_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TotalEarningRecent extends StatelessWidget {
  const TotalEarningRecent({super.key});

  @override
  Widget build(BuildContext context) {
    WithdrawHistoryController controller = Get.put(WithdrawHistoryController());
    return Obx(
      () {
        return PaddedScreen(
          padding: 15.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyles.customText(
                title: "Recent Earnings",
              ),
              SizedBox(height: 20.h),
              ListView.builder(
                itemCount: controller.withdrawHistory.value!.withdraw!.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: earningBox(index: index),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget earningBox({required int index}) {
    WithdrawHistoryController controller = Get.put(WithdrawHistoryController());
    return Obx(
      () {
        return GlassmorphismCard(
          boxHeight: 55.h,
          horizontalPadding: 15.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100.w,
                child: customText(
                  title: controller.withdrawHistory.value!.withdraw![index].date
                      .toString(),
                ),
              ),
              SizedBox(
                width: 80.w,
                child: customText(
                  title: controller
                      .withdrawHistory.value!.withdraw![index].status
                      .toString()
                      .toUpperCase(),
                ),
              ),
              SizedBox(
                width: 100.w,
                child: customText(
                  title:
                      "${controller.withdrawHistory.value!.withdraw![index].amount.toString()} Bdt",
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget customText({required String title, TextAlign? textAlign}) {
    return TextStyles.customText(
      title: title,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
