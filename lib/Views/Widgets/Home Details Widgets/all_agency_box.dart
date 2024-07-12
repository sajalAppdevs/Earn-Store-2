import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/agency_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllAgencyBox extends StatelessWidget {
  const AllAgencyBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return agencyBox(index: index);
      },
    );
  }

  Widget agencyBox({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
      ),
      child: GlassmorphismCard(
        boxHeight: 175.h,
        boxRightPadding: 15.w,
        onPressed: () {
          Get.to(
            const AgencyDetails(),
          );
        },
        childAlignment: Alignment.centerLeft,
        boxLeftPadding: 20.w,
        child: Image.asset(
          "${Paths.imagePath}hajj.jpg",
          height: 150.h,
          width: 300.w,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
