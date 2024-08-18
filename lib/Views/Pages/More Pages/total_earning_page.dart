import 'package:earn_store/Controllers/User%20Controllers/withdraw_history_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/total_earning_recent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TotalEarningPage extends StatefulWidget {
  const TotalEarningPage({super.key});

  @override
  State<TotalEarningPage> createState() => _TotalEarningPageState();
}

class _TotalEarningPageState extends State<TotalEarningPage> {
  WithdrawHistoryController controller = Get.put(WithdrawHistoryController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getWithdrawHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.historyLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CustomTop(
                      title: "Total Earning",
                    ),
                    SizedBox(height: 20.h),
                    totalEarningTopBox(),
                    SizedBox(height: 20.h),
                    const TotalEarningRecent()
                  ],
                ),
              );
      },
    );
  }

  Widget totalEarningTopBox() {
    return PaddedScreen(
      child: GlassmorphismCard(
        boxHeight: 100.h,
        verticalPadding: 15.h,
        horizontalPadding: 20.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextStyles.customText(
              title: "Today",
              fontSize: 20.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextStyles.customText(
                  title: "Total Income",
                  fontWeight: FontWeight.w500,
                ),
                TextStyles.customText(
                  title: "305 Bdt",
                  fontSize: 24.sp,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
