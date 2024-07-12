import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Chat%20Pages/chat_details_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatPageBody extends StatelessWidget {
  const ChatPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return chatBox(index: index);
      },
    );
  }

  Widget chatBox({required int index}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: GlassmorphismCard(
        onPressed: () {
          Get.to(
            const ChatDetailsPage(),
          );
        },
        boxHeight: 65.h,
        horizontalPadding: 15.w,
        verticalPadding: 10.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            chatImage(index: index),
            SizedBox(width: 15.w),
            chatInfo(index: index)
          ],
        ),
      ),
    );
  }

  Widget chatImage({required int index}) {
    return Container(
      height: 41.h,
      width: 41.w,
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

  Widget chatInfo({required int index}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 151.w,
              child: TextStyles.customText(
                title: "Soykot Hosen",
                fontSize: 14.sp,
                textAlign: TextAlign.left,
              ),
            ),
            chatDate(index: index)
          ],
        ),
        SizedBox(
          width: 242.w,
          child: TextStyles.customText(
            title: "Hi. How are you ?",
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  Widget chatDate({required int index}) {
    return TextStyles.customText(
      title: "4:00 PM 21 Apr 2024",
      fontSize: 9.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
