import 'package:earn_store/Controllers/Car%20Controllers/car_details_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Utils/url_helpers.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RideVehicleDetails extends StatefulWidget {
  final String carID;
  const RideVehicleDetails({super.key, required this.carID});

  @override
  State<RideVehicleDetails> createState() => _RideVehicleDetailsState();
}

class _RideVehicleDetailsState extends State<RideVehicleDetails> {
  CarDetailsController controller = Get.put(CarDetailsController());
  UserProfileController userProfileController =
      Get.put(UserProfileController());

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getCarDetails(carID: widget.carID);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.carDetailsLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CustomTop(title: "Details"),
                    infoBox(),
                    SizedBox(height: 50.h),
                    userProfileController
                                .userData.value!.user!.isPaymentVerified ==
                            0
                        ? CustomButton(
                            horizontalMargin: 20.w,
                            width: 150.w,
                            onPressed: () {
                              Snackbars.successSnackBar(
                                  title: "Booking Status",
                                  description: "Sended To Admin");
                              Get.offAll(
                                const RootScreen(),
                              );
                            },
                            buttonText: "Book",
                          )
                        : buttonRow(),
                    SizedBox(height: 50.h),
                  ],
                ),
              );
      },
    );
  }

  Widget infoBox() {
    return Obx(
      () {
        return PaddedScreen(
          padding: 10.w,
          child: GlassmorphismCard(
            verticalPadding: 15.h,
            horizontalPadding: 15.w,
            boxHeight: 490.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NetworkImageWidget(
                  imageUrl: controller.carDetails.value!.data!.image.toString(),
                  height: 180.h,
                  width: Get.width,
                  verticalPaddingForLoading: 50.h,
                ),
                SizedBox(height: 15.h),
                vehicleTopInfo(),
                SizedBox(height: 10.h),
                vehicleCapacity(),
                SizedBox(height: 15.h),
                customText2(title: "1 min away . 1 : 30 PM"),
                SizedBox(height: 15.h),
                customText2(
                  title:
                      "Shop Name: ${controller.carDetails.value!.data!.carShopName}",
                ),
                SizedBox(height: 20.h),
                customText(title: "Description"),
                SizedBox(height: 15.h),
                SizedBox(
                  height: 75.h,
                  child: customText2(
                    title: controller.carDetails.value!.data!.description
                        .toString(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget vehicleTopInfo() {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(
                title: controller.carDetails.value!.data!.name.toString()),
            customText2(
                title: "BDT ${controller.carDetails.value!.data!.price}"),
          ],
        );
      },
    );
  }

  Widget vehicleCapacity() {
    return Obx(
      () {
        return Row(
          children: [
            Icon(
              Icons.person_2_outlined,
              color: TextColors.textColor1,
              size: 17.sp,
            ),
            customText(
              title: controller.carDetails.value!.data!.seat.toString(),
            ),
          ],
        );
      },
    );
  }

  Widget buttonRow() {
    return PaddedScreen(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            width: 150.w,
            onPressed: () async {
              await UrlHelpers.shareOnSocialMedia(
                  url: "https://earnstor.lens-ecom.store/?refer=34?id=45");
            },
            buttonText: "Refer",
          ),
          CustomButton(
            width: 150.w,
            onPressed: () {
              Snackbars.successSnackBar(
                  title: "Booking Status", description: "Sended To Admin");
              Get.offAll(
                const RootScreen(),
              );
            },
            buttonText: "Book",
          ),
        ],
      ),
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
    );
  }

  Widget customText2({required String title}) {
    return TextStyles.customText(
      title: title,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      isShowAll: true,
      textAlign: TextAlign.left,
    );
  }
}
