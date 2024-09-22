import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Home%20Controllers/all_agency_controller.dart';
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
import 'package:google_fonts/google_fonts.dart';

class AgencyDetailsBody extends StatelessWidget {
  final int index;
  const AgencyDetailsBody({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    AllAgencyController controller = Get.put(
      AllAgencyController(),
    );
    return Obx(
      () {
        return PaddedScreen(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              agencyImage(
                  imagePath: controller.agencies.value!.agencys![index].image
                      .toString()),
              SizedBox(height: 20.h),
              TextStyles.customText(
                title: controller.agencies.value!.agencys![index].agencyName
                    .toString(),
              ),
              SizedBox(height: 5.h),
              TextStyles.customText(
                title:
                    controller.agencies.value!.agencys![index].email.toString(),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                isShowAll: true,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 5.h),
              packageWidget(index: index),
              SizedBox(height: 50.h),
              buttonRow(),
              SizedBox(height: 40.h),
            ],
          ),
        );
      },
    );
  }

  Widget agencyImage({required String imagePath}) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder: (context, imageProvider) => Container(
        height: 150.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const ButtonLoading(),
      errorWidget: (context, url, error) => Container(
        height: 150.h,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget packageWidget({required int index}) {
    AllAgencyController controller = Get.put(
      AllAgencyController(),
    );
    return Obx(
      () {
        return RichText(
          text: TextSpan(
            text: 'Mobile: ',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: TextColors.textColor1,
            ),
            children: <TextSpan>[
              TextSpan(
                text: controller.agencies.value!.agencys![index].mobileNumber
                    .toString(),
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: TextColors.textColor4,
                ),
              ),
            ],
          ),
        );
      },
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
          buttonText: "Book",
        ),
      ],
    );
  }
}
