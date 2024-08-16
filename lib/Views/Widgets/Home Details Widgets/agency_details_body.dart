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
import 'package:google_fonts/google_fonts.dart';

class AgencyDetailsBody extends StatelessWidget {
  const AgencyDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          agencyImage(),
          SizedBox(height: 20.h),
          TextStyles.customText(
            title: "Haramain Hajj Umrah Ltd",
          ),
          SizedBox(height: 5.h),
          TextStyles.customText(
            title: "One of the best Halal travel agencies in Bangladesh.",
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            isShowAll: true,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 5.h),
          packageWidget(),
          SizedBox(height: 50.h),
          buttonRow(),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget agencyImage() {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        image: const DecorationImage(
          image: AssetImage(
            "${Paths.imagePath}hajj.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget packageWidget() {
    return RichText(
      text: TextSpan(
        text: 'Package starts from ',
        style: GoogleFonts.poppins(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: TextColors.textColor1,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '1,25,000৳',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: TextColors.textColor4,
            ),
          ),
        ],
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
          buttonText: "Book",
        ),
      ],
    );
  }
}
