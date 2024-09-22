import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Match%20Pages/match_news_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MatchListSelector extends StatelessWidget {
  const MatchListSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        selectorBox(
          title: "MATCHES",
          onPressed: () {},
        ),
        selectorBox(
          title: "NEWS",
          onPressed: () {
            Get.to(
              const MatchNewsPage(),
            );
          },
        ),
      ],
    );
  }

  Widget selectorBox({
    required String title,
    required VoidCallback onPressed,
  }) {
    return GlassmorphismCard(
      boxHeight: 50.h,
      boxWidth: Get.width * 0.5,
      onPressed: onPressed,
      child: TextStyles.customText(
        title: title,
      ),
    );
  }
}
