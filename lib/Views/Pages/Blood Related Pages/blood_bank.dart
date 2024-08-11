import 'package:earn_store/Controllers/Blood%20Controllers/recent_donation_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
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

class BloodBank extends StatefulWidget {
  const BloodBank({super.key});

  @override
  State<BloodBank> createState() => _BloodBankState();
}

class _BloodBankState extends State<BloodBank> {
  RecentDonationController controller = Get.put(RecentDonationController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getRecentDonation();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.donationLoading.value
            ? const ScreenLoading()
            : RootDesign(
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
      },
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
