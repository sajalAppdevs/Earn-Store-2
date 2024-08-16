import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
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
  const PDFResourcesDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pdfImage(),
          SizedBox(height: 30.h),
          TextStyles.customText(
            title: "HSC 2024 Special Suggestion",
          ),
          SizedBox(height: 5.h),
          TextStyles.customText(
            title: "200 Taka",
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
            title:
                "Figma design is for people to create, share, and test designs for websites, mobile apps, and other digital products and experiences.",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            isShowAll: true,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 50.h),
          buttonRow(),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  Widget pdfImage() {
    return Image.asset(
      "${Paths.iconPath}pdf_details.png",
      height: 175.h,
      width: Get.width,
      fit: BoxFit.fill,
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
