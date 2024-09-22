import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveChatTop extends StatelessWidget {
  const LiveChatTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
        bottom: 20.h,
        left: 10.w,
        right: 10.w,
      ),
      child: GlassmorphismCard(
        boxHeight: 65.h,
        boxLeftPadding: 15.w,
        boxRightPadding: 8.h,
        child: Row(
          children: [
            chatImage(),
            SizedBox(width: 10.w),
            userName(),
          ],
        ),
      ),
    );
  }

  Widget chatImage() {
    return Container(
      height: 40.h,
      width: 40.w,
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

  Widget userName() {
    return SizedBox(
      width: 220.w,
      child: TextStyles.customText(
        title: "Admin",
        fontSize: 14.sp,
        textAlign: TextAlign.left,
      ),
    );
  }
}
