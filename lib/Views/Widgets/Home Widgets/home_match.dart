import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Match%20Pages/match_list_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeMatch extends StatelessWidget {
  const HomeMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          title: "Cricket Match Update",
          onPressed: () {
            Get.to(
              const MatchListPage(),
            );
          },
        ),
        SizedBox(height: 10.h),
        ListView.builder(
          itemCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return matchBox(index: index);
          },
        )
      ],
    );
  }

  Widget matchBox({required int index}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyles.customText(title: "Sun, Jun 2"),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: GlassmorphismCard(
            boxHeight: 120.h,
            horizontalPadding: 15.h,
            verticalPadding: 15.w,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(title: "Group Stage . T20  1 of 55"),
                    customText(title: "Sun, Jun 2"),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    countryBox(
                      flagPath: "canada.png",
                      countryName: "Canada",
                    ),
                    Image.asset(
                      "${Paths.iconPath}vs.png",
                      height: 35.h,
                      width: 35.w,
                    ),
                    countryBox(
                      flagPath: "usa.png",
                      countryName: "United States",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
    );
  }

  Widget countryBox({
    required String flagPath,
    required String countryName,
  }) {
    return Row(
      children: [
        Image.asset(
          Paths.iconPath + flagPath,
          height: 30.h,
          width: 35.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 8.w),
        TextStyles.customText(
          title: countryName,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
