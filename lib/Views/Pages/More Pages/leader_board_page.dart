import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/leaderboard_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaderBoardPage extends StatelessWidget {
  const LeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Leaderboard"),
          PaddedScreen(
            padding: 15.w,
            child: Column(
              children: [
                leaderBoardTopTitles(),
                SizedBox(height: 20.h),
                const LeaderboardBody()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget leaderBoardTopTitles() {
    return PaddedScreen(
      padding: 5.w,
      child: Row(
        children: [
          customText(title: "Rank"),
          SizedBox(width: 20.w),
          customText(title: "Top Learner"),
          SizedBox(width: 50.w),
          customText(title: "Refer"),
          SizedBox(width: 20.w),
          customText(title: "Point"),
        ],
      ),
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
      fontWeight: FontWeight.w500,
    );
  }
}
