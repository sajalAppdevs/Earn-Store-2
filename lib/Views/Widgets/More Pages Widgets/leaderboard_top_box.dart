import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaderboardTopBox extends StatelessWidget {
  final int index;
  const LeaderboardTopBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: topBox(index: index),
    );
  }

  Widget topBox({required int index}) {
    int king = index + 1;
    Alignment alignment = Alignment.centerLeft;
    if (index == 1) {
      alignment = Alignment.centerRight;
    }
    return Align(
      alignment: alignment,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GlassmorphismCard(
            boxHeight: 65.h,
            boxWidth: 260.w,
            borderRadius: 45.r,
            horizontalPadding: 15.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  title: index.toString(),
                ),
                nameAndImage(),
                customText(
                  title: "9",
                ),
                customText(
                  title: "1875",
                ),
              ],
            ),
          ),
          Positioned(
            left: index == 1 ? 5 : 225.w,
            top: -8.h,
            child: Image.asset(
              "${Paths.iconPath}king$king.png",
              height: 30.h,
              width: 30.w,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }

  Widget nameAndImage() {
    return Row(
      children: [
        Container(
          height: 17.h,
          width: 17.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                "${Paths.imagePath}blank_image.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 2.w),
        SizedBox(
          width: 110.w,
          child: TextStyles.customText(
            title: "Rashidatul Kobra",
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.left,
          ),
        )
      ],
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );
  }
}
