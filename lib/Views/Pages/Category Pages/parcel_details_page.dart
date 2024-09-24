import 'package:earn_store/Controllers/Home%20Controllers/parcel_delivery_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Utils/url_helpers.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ParcelDetails extends StatefulWidget {
  final int index;
  const ParcelDetails({super.key, required this.index});

  @override
  State<ParcelDetails> createState() => _ParcelDetailsState();
}

class _ParcelDetailsState extends State<ParcelDetails> {
  UserProfileController userProfileController =
      Get.put(UserProfileController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return RootDesign(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const CustomTop(title: "Parcel Booking"),
              parcelImage(),
              parcelInfo(),
              SizedBox(height: 50.h),
              userProfileController.userData.value!.user!.isPaymentVerified == 0
                  ? CustomButton(
                      width: 150.w,
                      horizontalMargin: 20.w,
                      onPressed: () {
                        Snackbars.successSnackBar(
                            title: "Booking Status",
                            description: "Sended To Admin");
                        Get.offAll(
                          const RootScreen(),
                        );
                      },
                      buttonText: "Book Now",
                    )
                  : buttonRow()
            ],
          ),
        );
      },
    );
  }

  Widget parcelImage() {
    ParcelDeliveryController controller = Get.put(
      ParcelDeliveryController(),
    );
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: NetworkImageWidget(
            imageUrl: controller
                .parcels.value!.deliveryCompany![widget.index].image
                .toString(),
            verticalPaddingForLoading: 50.h,
            height: 145.h,
            width: Get.width,
          ),
        );
      },
    );
  }

  Widget parcelInfo() {
    ParcelDeliveryController controller = Get.put(
      ParcelDeliveryController(),
    );
    return Obx(
      () {
        return PaddedScreen(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyles.customText(
                title: controller
                    .parcels.value!.deliveryCompany![widget.index].name
                    .toString(),
              ),
              SizedBox(height: 10.h),
              TextStyles.customText(
                title:
                    "One of the best delivery services in Bangladesh. Package starts from 125.00৳",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                isShowAll: true,
                textAlign: TextAlign.left,
              ),
            ],
          ),
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
            buttonText: "Book Now",
          ),
        ],
      ),
    );
  }
}
