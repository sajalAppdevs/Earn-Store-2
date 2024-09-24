import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedBoxTop extends StatelessWidget {
  const FeedBoxTop({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      child: Row(
        children: [
          userImage(),
          SizedBox(width: 10.w),
          userInfo(),
        ],
      ),
    );
  }

  Widget userImage() {
    return Container(
      height: 45.h,
      width: 45.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            "${Paths.imagePath}blank_image.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget userInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 175.w,
              child: TextStyles.customText(
                title: "Earn Store Admin",
                fontSize: 14.sp,
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
                size: 25.sp,
                color: TextColors.textColor1,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.close,
                size: 25.sp,
                color: TextColors.textColor1,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextStyles.customText(
              title: "5d",
              fontSize: 14.sp,
            ),
            SizedBox(width: 5.w),
            Image.asset(
              "${Paths.iconPath}earth.png",
              height: 15.h,
              width: 15.w,
              fit: BoxFit.fill,
            )
          ],
        )
      ],
    );
  }
}
