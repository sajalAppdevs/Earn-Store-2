import 'package:earn_store/Controllers/Earning%20Controllers/withdraw_controller.dart';
import 'package:earn_store/Utils/dummy_data.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WithdrawBody extends StatelessWidget {
  const WithdrawBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleText(title: "Withdrawal Method"),
          SizedBox(height: 20.h),
          withdrawMethods(),
          SizedBox(height: 30.h),
          titleText2(title: "Enter Account Number"),
          CustomField(
            hintText: "eg: 018XXXXXXXX",
            controller: TextEditingController(),
          ),
          SizedBox(height: 20.h),
          titleText2(title: "Enter Amount"),
          CustomField(
            hintText: "eg: 1000",
            controller: TextEditingController(),
          ),
          SizedBox(height: 100.h),
          CustomButton(
            onPressed: () {
              Snackbars.successSnackBar(
                title: "Withdraw Status",
                description: "Sended to admin",
              );
              Get.offAll(
                const RootScreen(),
              );
            },
            buttonText: "Proceed",
          ),
          SizedBox(height: 70.h),
        ],
      ),
    );
  }

  Widget titleText({required String title}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: TextStyles.customText(
        title: title,
      ),
    );
  }

  Widget titleText2({required String title}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: TextStyles.customText(
        title: title,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget withdrawMethods() {
    WithdrawController controller = Get.put(WithdrawController());
    return Obx(
      () {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              DummyData.withdrawMethods.length,
              (index) {
                return controller.withdrawMethodIndex.value == index
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: GlassmorphismCard(
                          boxHeight: 60.h,
                          boxWidth: 65.w,
                          onPressed: () {
                            controller.withdrawMethodChange(index: index);
                          },
                          child: Image.asset(
                            DummyData.withdrawMethods[index].imagePath,
                            height: DummyData.withdrawMethods[index].height,
                            width: DummyData.withdrawMethods[index].width,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.withdrawMethodChange(index: index);
                        },
                        child: Container(
                          height: 60.h,
                          width: 65.w,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white.withOpacity(0.5),
                          ),
                          child: Image.asset(
                            DummyData.withdrawMethods[index].imagePath,
                            height: DummyData.withdrawMethods[index].height,
                            width: DummyData.withdrawMethods[index].width,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
              },
            ),
          ),
        );
      },
    );
  }
}
