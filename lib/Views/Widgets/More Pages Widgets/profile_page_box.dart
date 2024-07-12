import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePageBox extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String info;
  const ProfilePageBox({
    super.key,
    required this.onPressed,
    required this.title,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphismCard(
      boxHeight: 150.h,
      verticalPadding: 20.h,
      horizontalPadding: 30.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          infoBox(),
          detailsButton(),
        ],
      ),
    );
  }

  Widget infoBox() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextStyles.customText(
            title: title,
          ),
          SizedBox(height: 5.h),
          TextStyles.customText(
            title: info,
            fontSize: 14.sp,
          ),
        ],
      ),
    );
  }

  Widget detailsButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: CustomButton(
        width: 140.w,
        onPressed: onPressed,
        buttonText: "View Details",
        textSize: 14.sp,
      ),
    );
  }
}
