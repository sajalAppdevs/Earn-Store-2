import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Home%20Controllers/pdf_and_resources_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Utils/url_helpers.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PDFResourcesDetailsBody extends StatelessWidget {
  final int index;
  const PDFResourcesDetailsBody({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    PDFAndResourcesController controller = Get.put(PDFAndResourcesController());
    UserProfileController userProfileController =
        Get.put(UserProfileController());
    return Obx(
      () {
        return PaddedScreen(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pdfImage(
                  imagePath: controller
                      .pdfAndResources.value!.pdfs![index].image
                      .toString()),
              SizedBox(height: 30.h),
              TextStyles.customText(
                title: controller.pdfAndResources.value!.pdfs![index].title
                    .toString(),
              ),
              SizedBox(height: 5.h),
              TextStyles.customText(
                title:
                    "${controller.pdfAndResources.value!.pdfs![index].price.toString()} Taka",
                color: TextColors.textColor3,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
              SizedBox(height: 20.h),
              TextStyles.customText(
                title: "Description",
              ),
              SizedBox(height: 10.h),
              TextStyles.customText(
                title: controller
                    .pdfAndResources.value!.pdfs![index].description
                    .toString(),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                isShowAll: true,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 50.h),
              userProfileController.userData.value!.user!.isPaymentVerified == 0
                  ? CustomButton(
                      width: 350.w,
                      onPressed: () {
                        Snackbars.successSnackBar(
                            title: "Booking Status",
                            description: "Sended To Admin");
                        Get.offAll(
                          const RootScreen(),
                        );
                      },
                      buttonText: "Buy",
                    )
                  : buttonRow(),
              SizedBox(height: 50.h),
            ],
          ),
        );
      },
    );
  }

  Widget pdfImage({required String imagePath}) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder: (context, imageProvider) => Container(
        height: 175.h,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => const ButtonLoading(),
      errorWidget: (context, url, error) => Container(
        height: 175.h,
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget buttonRow() {
    return Row(
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
          buttonText: "Buy",
        ),
      ],
    );
  }
}
