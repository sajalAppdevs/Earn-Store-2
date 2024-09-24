import 'package:earn_store/Controllers/Splash%20&%20Auth%20Controllers/add_payment_controller.dart';
import 'package:earn_store/Controllers/Splash%20&%20Auth%20Controllers/all_package_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Utils/url_helpers.dart';
import 'package:earn_store/Views/Common%20Widgets/auth_top_logo.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/payment_success_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PackagePage extends StatefulWidget {
  const PackagePage({super.key});

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  AllPackageController controller = Get.put(AllPackageController());
  AddPaymentController addPaymentController = Get.put(AddPaymentController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    controller.getPackages();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.packageLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: PaddedScreen(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(height: 40.h),
                      const AuthTopLogo(),
                      SizedBox(height: 10.h),
                      TextStyles.customText(
                        title: "Packages",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 30.h),
                      addPaymentController.addPaymentLoading.value
                          ? const ButtonLoading()
                          : Column(
                              children: List.generate(
                                controller.packages.value!.packages!.length,
                                (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 30.h),
                                    child: packageBox(
                                      title: controller.packages.value!
                                          .packages![index].packageName
                                          .toString(),
                                      price: controller.packages.value!
                                                  .packages![index].price!
                                                  .toInt() ==
                                              0
                                          ? "Free"
                                          : "\$${controller.packages.value!.packages![index].price}",
                                      onPressed: controller.packages.value!
                                                  .packages![index].price!
                                                  .toInt() ==
                                              0
                                          ? () {
                                              Get.offAll(
                                                const RootScreen(),
                                              );
                                            }
                                          : () async {
                                              await UrlHelpers.openUrl(
                                                  "https://shop.bkash.com/an-telecom01919914978/pay/bdt${controller.packages.value!.packages![index].price.toString()}/QfZsiU");
                                              await addPaymentController
                                                  .addPayment(
                                                      amount: controller
                                                          .packages
                                                          .value!
                                                          .packages![index]
                                                          .price
                                                          .toString(),
                                                      packageID: controller
                                                          .packages
                                                          .value!
                                                          .packages![index]
                                                          .id
                                                          .toString());
                                              Get.to(
                                                const PaymentSuccessPage(),
                                              );
                                            },
                                    ),
                                  );
                                },
                              ),
                            ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              );
      },
    );
  }

  Widget packageBox({
    required String title,
    required String price,
    required VoidCallback onPressed,
  }) {
    return GlassmorphismCard(
      boxHeight: 260.h,
      verticalPadding: 15.h,
      horizontalPadding: 20.w,
      child: Column(
        children: [
          TextStyles.customText(
            title: title,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 20.h),
          TextStyles.customText(
            title: '''In this plan you will only buy
you can not earn. This is free basic Plan for you.''',
            fontSize: 18.sp,
            isShowAll: true,
            fontWeight: FontWeight.w400,
          ),
          const Spacer(),
          buttonRow(price: price, onPressed: onPressed),
        ],
      ),
    );
  }

  Widget buttonRow({
    required String price,
    required VoidCallback onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          width: 130.w,
          onPressed: () {},
          buttonText: price,
        ),
        CustomButton(
          width: 130.w,
          onPressed: onPressed,
          buttonText: "Select",
        ),
      ],
    );
  }
}
