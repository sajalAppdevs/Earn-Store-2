import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllWatchVideoBox extends StatelessWidget {
  const AllWatchVideoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      child: ListView.builder(
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return videoBox(index: index);
        },
      ),
    );
  }

  Widget videoBox({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GlassmorphismCard(
        boxHeight: 150.h,
        boxTopPadding: 30.h,
        boxBottomPadding: 20.h,
        boxLeftPadding: 20.w,
        boxRightPadding: 20.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "${Paths.iconPath}play.png",
              height: 40.h,
              width: 40.w,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextStyles.customText(
                  title: "Play Video",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                TextStyles.customText(
                  title: "Total Point: 1001",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
