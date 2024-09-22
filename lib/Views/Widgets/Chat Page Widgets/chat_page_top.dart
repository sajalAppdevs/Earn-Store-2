import 'package:earn_store/Controllers/Social%20Media%20Controllers/conversation_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Pages/Chat%20Pages/all_user_page.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    ConversationController conversationController =
        Get.put(ConversationController());
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Row(
            children: [
              CustomButton(
                height: 35.h,
                width: 85.w,
                textSize: 12.sp,
                buttonColor: conversationController.isSoloConvo.value
                    ? IconColors.iconColor1
                    : null,
                onPressed: () {
                  conversationController.changeConvoType(value: true);
                },
                buttonText: "ALL",
              ),
              SizedBox(width: 10.w),
              CustomButton(
                height: 35.h,
                width: 85.w,
                textSize: 12.sp,
                buttonColor: conversationController.isSoloConvo.value
                    ? null
                    : IconColors.iconColor1,
                onPressed: () {
                  conversationController.changeConvoType(value: false);
                },
                buttonText: "Group",
              ),
            ],
          ),
        );
      },
    );
  }

  Widget searchAndMore() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: GestureDetector(
        onTap: () {
          Get.to(const AllUserPage());
        },
        child: Image.asset(
          "${Paths.iconPath}chat_search.png",
          height: 34.h,
          width: 46.w,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
