import 'package:earn_store/Controllers/Home%20Controllers/general_info_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/operator_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/recharge_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({super.key});

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  OperatorController operatorController = Get.put(OperatorController());
  RechargeController controller = Get.put(
    RechargeController(),
  );
  TextEditingController mobileController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await operatorController.getOperators();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return operatorController.methodsLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CustomTop(title: "Recharge Money"),
                    SizedBox(height: 30.h),
                    balanceWidget(),
                    SizedBox(height: 40.h),
                    PaddedScreen(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          operatorsMethod(),
                          SizedBox(height: 30.h),
                          titleText(title: "Enter Account Number"),
                          CustomField(
                            hintText: "",
                            controller: mobileController,
                          ),
                          SizedBox(height: 30.h),
                          titleText(title: "Enter Amount"),
                          CustomField(
                            hintText: "",
                            controller: amountController,
                          ),
                          SizedBox(height: 200.h),
                          controller.rechargeLoading.value
                              ? const ButtonLoading()
                              : CustomButton(
                                  onPressed: () async {
                                    UserProfileController
                                        userProfileController =
                                        Get.put(UserProfileController());
                                    GeneralInfoController
                                        generalInfoController =
                                        Get.put(GeneralInfoController());
                                    String balance =
                                        generalInfoController.getBalance(
                                      userPoint: userProfileController
                                          .userData.value!.user!.point!
                                          .toInt(),
                                      currencyPerPoint: generalInfoController
                                          .generalInfos
                                          .value!
                                          .generalInfos!
                                          .point!
                                          .toDouble(),
                                    );
                                    bool status = controller.availableChecker(
                                        requestedAmount: amountController.text,
                                        balance: balance);
                                    if (status) {
                                      await controller.recharge(
                                        number: mobileController.text,
                                        amount: amountController.text,
                                      );
                                    } else {
                                      Snackbars.unSuccessSnackBar(
                                        title: "Money recharge Status",
                                        description:
                                            "You have sufficient balance",
                                      );
                                    }
                                  },
                                  buttonText: "Proceed",
                                ),
                          SizedBox(height: 70.h),
                        ],
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }

  Widget balanceWidget() {
    UserProfileController userProfileController =
        Get.put(UserProfileController());
    GeneralInfoController generalInfoController =
        Get.put(GeneralInfoController());
    return Obx(
      () {
        String balance = generalInfoController.getBalance(
          userPoint: userProfileController.userData.value!.user!.point!.toInt(),
          currencyPerPoint: generalInfoController
              .generalInfos.value!.generalInfos!.point!
              .toDouble(),
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextStyles.customText(
              title:
                  "Your account balance is: ${userProfileController.userData.value!.user!.point.toString()} X ${generalInfoController.generalInfos.value!.generalInfos!.point.toString()}",
              fontSize: 14.sp,
            ),
            SizedBox(height: 10.h),
            TextStyles.customText(
              title: "$balance BDT",
              fontSize: 22.sp,
            )
          ],
        );
      },
    );
  }

  Widget operatorsMethod() {
    OperatorController controller = Get.put(
      OperatorController(),
    );
    return Obx(
      () {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.operators.value!.operator!.length,
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
                            controller.setOperators(index: index);
                          },
                          child: NetworkImageWidget(
                            imageUrl: controller
                                .operators.value!.operator![index].logo
                                .toString(),
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.setOperators(index: index);
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
                                .operators.value!.operator![index].logo
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

  Widget titleText({required String title}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 5.w),
      child: TextStyles.customText(
        title: title,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
