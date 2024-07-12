import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Blood%20Related%20Pages/donor_search_second.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DonorSearchFirst extends StatelessWidget {
  const DonorSearchFirst({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> bloodGroups = [
      "A Positive",
      "A Negative",
      "B Positive",
      "B Negative",
      "AB Positive",
      "AB Negative",
      "O Positive",
      "O Negative",
    ];
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Blood Group"),
          Column(
            children: List.generate(
              bloodGroups.length,
              (index) => bloodGroupBox(
                bloodGroups: bloodGroups,
                index: index,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bloodGroupBox(
      {required List<String> bloodGroups, required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      child: GlassmorphismCard(
        boxHeight: 55.h,
        horizontalPadding: 20.w,
        onPressed: () {
          Get.to(
            DonorSearchSecond(
              bloodGroup: bloodGroups[index],
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextStyles.customText(
              title: bloodGroups[index],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20.sp,
              color: TextColors.textColor1,
            )
          ],
        ),
      ),
    );
  }
}
