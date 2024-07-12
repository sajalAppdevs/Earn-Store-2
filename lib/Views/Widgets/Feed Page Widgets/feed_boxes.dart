import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/feed_box_activity_count.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/feed_box_bottom.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/feed_box_content.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/feed_box_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedBoxes extends StatelessWidget {
  const FeedBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return feedBox();
      },
    );
  }

  Widget feedBox() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.4),
        boxShadow: [
          BoxShadow(
            color: GeneralColors.shadowColor1.withOpacity(0.26),
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(1.18, 1.18),
          ),
          BoxShadow(
            color: GeneralColors.blackColor.withOpacity(0.30),
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(-1.18, -1.18),
          ),
        ],
      ),
      child: Column(
        children: [
          const FeedBoxTop(),
          SizedBox(height: 15.h),
          const FeedBoxContent(),
          SizedBox(height: 15.h),
          const FeedBoxActivityCount(),
          SizedBox(height: 10.h),
          Divider(
            color: TextColors.textColor1,
            height: 1.h,
            thickness: 0.4,
          ),
          SizedBox(height: 15.h),
          const FeedBoxBottom()
        ],
      ),
    );
  }
}
