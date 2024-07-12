import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/agency_details.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_agency_page.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeAgency extends StatelessWidget {
  const HomeAgency({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(
          title: "Agency",
          onPressed: () {
            Get.to(
              const AllAgencyPage(),
            );
          },
        ),
        SizedBox(height: 10.h),
        agencies(),
      ],
    );
  }

  Widget agencies() {
    return Column(
      children: List.generate(
        3,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: 15.w),
          child: GlassmorphismCard(
            onPressed: () {
              Get.to(
                const AgencyDetails(),
              );
            },
            boxHeight: 150.h,
            child: Image.asset(
              "${Paths.imagePath}hajj.jpg",
              height: 130.h,
              width: 285.w,
            ),
          ),
        ),
      ),
    );
  }
}
