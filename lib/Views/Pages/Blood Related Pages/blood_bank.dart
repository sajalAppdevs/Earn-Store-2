import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Blood%20Related%20Pages/be_donor_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Blood%20Related%20Widgets/blood_bank_banner.dart';
import 'package:earn_store/Views/Widgets/Blood%20Related%20Widgets/blood_page_selector.dart';
import 'package:earn_store/Views/Widgets/Blood%20Related%20Widgets/recent_donors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BloodBank extends StatelessWidget {
  const BloodBank({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Blood Bank"),
          const BloodPageSelector(),
          SizedBox(height: 30.h),
          beDonorButton(),
          SizedBox(height: 30.h),
          const BloodBankBanner(),
          SizedBox(height: 40.h),
          const RecentDonors(),
        ],
      ),
    );
  }

  Widget beDonorButton() {
    return PaddedScreen(
      padding: 30.w,
      child: GlassmorphismCard(
        boxHeight: 55.h,
        onPressed: () {
          Get.to(
            const BeDonorPage(),
          );
        },
        child: TextStyles.customText(
          title: "Be a Donar",
        ),
      ),
    );
  }
}
