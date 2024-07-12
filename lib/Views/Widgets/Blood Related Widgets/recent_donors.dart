import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentDonors extends StatelessWidget {
  const RecentDonors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleBar(),
        SizedBox(height: 30.h),
        ListView.builder(
          itemCount: 5,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return recentDonorBox(index: index);
          },
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget titleBar() {
    return GlassmorphismCard(
      boxHeight: 50.h,
      borderRadius: 0,
      onPressed: () {},
      child: TextStyles.customText(
        title: "Those who recently donated blood",
      ),
    );
  }

  Widget recentDonorBox({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 15.h,
      ),
      child: GlassmorphismCard(
        boxHeight: 150.h,
        verticalPadding: 10.h,
        horizontalPadding: 15.w,
        borderRadius: 75.r,
        child: Column(
          children: [
            nameWidget(),
            SizedBox(height: 10.h),
            statusWidget(),
            SizedBox(height: 10.h),
            TextStyles.customText(
              title: "Date : 03/06/2024",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  Widget nameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextStyles.customText(
          title: "Congratulations!",
        ),
        SizedBox(height: 2.h),
        TextStyles.customText(title: "Rashidatul Kobra"),
      ],
    );
  }

  Widget statusWidget() {
    return PaddedScreen(
      padding: 5.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextStyles.customText(
            title: "Receive : Tabid",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          Image.asset(
            "${Paths.iconPath}blood_drop.png",
            height: 30.h,
            width: 30.w,
            fit: BoxFit.fill,
          ),
          TextStyles.customText(
            title: "Location: Bogura",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
