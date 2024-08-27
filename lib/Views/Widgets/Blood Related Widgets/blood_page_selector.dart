import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Blood%20Related%20Pages/donor_search_first.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BloodPageSelector extends StatelessWidget {
  const BloodPageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // selectorBox(
        //   title: "Recent",
        //   onPressed: () {},
        // ),
        selectorBox(
          title: "Search",
          onPressed: () {
            Get.to(
              const DonorSearchFirst(),
            );
          },
        ),
        // selectorBox(
        //   title: "Profile",
        //   onPressed: () {
        //     Get.to(
        //       const DonorProfilePage(),
        //     );
        //   },
        // )
      ],
    );
  }

  Widget selectorBox({
    required String title,
    required VoidCallback onPressed,
  }) {
    return GlassmorphismCard(
      boxHeight: 50.h,
      boxWidth: Get.width * 0.33,
      onPressed: onPressed,
      child: TextStyles.customText(
        title: title,
      ),
    );
  }
}
