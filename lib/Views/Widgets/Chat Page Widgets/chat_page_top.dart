import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPageTop extends StatelessWidget {
  const ChatPageTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buttonRow(),
        searchAndMore(),
      ],
    );
  }

  Widget buttonRow() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        children: [
          CustomButton(
            height: 35.h,
            width: 85.w,
            textSize: 12.sp,
            onPressed: () {},
            buttonText: "ALL",
          ),
          SizedBox(width: 10.w),
          CustomButton(
            height: 35.h,
            width: 85.w,
            textSize: 12.sp,
            onPressed: () {},
            buttonText: "Group",
          ),
        ],
      ),
    );
  }

  Widget searchAndMore() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        children: [
          Image.asset(
            "${Paths.iconPath}chat_search.png",
            height: 34.h,
            width: 46.w,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 10.w),
          Icon(
            Icons.more_vert,
            size: 30.sp,
            color: TextColors.textColor4,
          )
        ],
      ),
    );
  }
}
