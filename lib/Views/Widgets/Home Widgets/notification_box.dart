import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationBox extends StatelessWidget {
  final int index;
  const NotificationBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        bottom: 10.h,
        top: 10.h,
      ),
      child: GlassmorphismCard(
        boxHeight: 100.h,
        boxLeftPadding: 15.w,
        boxRightPadding: 15.w,
        boxBottomPadding: 15.h,
        boxTopPadding: 12.h,
        child: Column(
          children: [
            topRow(index: index),
            SizedBox(height: 3.h),
            dateWidget(index: index),
            SizedBox(height: 10.h),
            notificationDetails(index: index),
          ],
        ),
      ),
    );
  }

  // GestureDetector(
  //     onTap: () {},
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       margin:
  //           EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h, top: 10.h),
  //       padding:
  //           EdgeInsets.only(left: 15.w, right: 15.w, top: 12.h, bottom: 20.h),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         boxShadow: [
  //           BoxShadow(
  //             color: const Color(0xff000000).withOpacity(0.25),
  //             blurRadius: 3,
  //             spreadRadius: 0,
  //             offset: const Offset(0, 1),
  //           )
  //         ],
  //       ),

  Widget topRow({required int index}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 280.w,
          child: TextStyles.customText(
            title: "Today happens biggest sales",
            textAlign: TextAlign.left,
            color: TextColors.textColor2,
            fontSize: 15.sp,
          ),
        ),
        Icon(
          Icons.push_pin,
          color: TextColors.textColor1,
          size: 15.sp,
        )
      ],
    );
  }

  Widget dateWidget({required int index}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextStyles.customText(
        title: "19-08-2024",
        fontSize: 10.sp,
        color: IconColors.iconColor1,
      ),
    );
  }

  Widget notificationDetails({required int index}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextStyles.customText(
        title: "It is a long established fact that a reader",
        fontSize: 12.sp,
        color: TextColors.textColor1.withOpacity(0.9),
      ),
    );
  }
}
