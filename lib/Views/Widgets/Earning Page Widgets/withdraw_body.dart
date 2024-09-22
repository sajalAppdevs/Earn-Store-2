import 'package:earn_store/Controllers/Home%20Controllers/general_info_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/payment_method_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/withdraw_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
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
    WithdrawController controller = Get.put(WithdrawController());
    TextEditingController mobileController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    return Obx(
      () {
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
                controller: mobileController,
              ),
              SizedBox(height: 20.h),
              titleText2(title: "Enter Amount"),
              CustomField(
                hintText: "eg: 1000",
                controller: amountController,
              ),
              SizedBox(height: 100.h),
              controller.withdrawLoading.value
                  ? const ButtonLoading()
                  : CustomButton(
                      onPressed: () async {
                        UserProfileController userProfileController =
                            Get.put(UserProfileController());
                        GeneralInfoController generalInfoController =
                            Get.put(GeneralInfoController());
                        String balance = generalInfoController.getBalance(
                          userPoint: userProfileController
                              .userData.value!.user!.point!
                              .toInt(),
                          currencyPerPoint: generalInfoController
                              .generalInfos.value!.generalInfos!.point!
                              .toDouble(),
                        );
                        bool status = controller.availableChecker(
                            requestedAmount: amountController.text,
                            balance: balance);
                        if (status) {
                          await controller.withdraw(
                              number: mobileController.text,
                              amount: amountController.text);
                        } else {
                          Snackbars.unSuccessSnackBar(
                            title: "Money Withdraw Status",
                            description: "You have sufficient balance",
                          );
                        }
                      },
                      buttonText: "Proceed",
                    ),
              SizedBox(height: 70.h),
            ],
          ),
        );
      },
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
    PaymentMethodController controller = Get.put(
      PaymentMethodController(),
    );
    return Obx(
      () {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.methods.value!.paymentMethods!.length,
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
                          child: NetworkImageWidget(
                            imageUrl: controller
                                .methods.value!.paymentMethods![index].logo
                                .toString(),
                            height: 30.h,
                            width: 30.w,
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
                          child: NetworkImageWidget(
                            imageUrl: controller
                                .methods.value!.paymentMethods![index].logo
                                .toString(),
                            height: 30.h,
                            width: 30.w,
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
