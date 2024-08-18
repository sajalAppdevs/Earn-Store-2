import 'package:earn_store/Controllers/Social%20Media%20Controllers/group_conversation_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Chat%20Pages/group_chat_details_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GroupChatBody extends StatelessWidget {
  const GroupChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    GroupConversationController groupConversationController =
        Get.put(GroupConversationController());
    return Obx(
      () {
        return ListView.builder(
          itemCount:
              groupConversationController.conversations.value!.groups!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return chatBox(index: index);
          },
        );
      },
    );
  }

  Widget chatBox({required int index}) {
    GroupConversationController groupConversationController =
        Get.put(GroupConversationController());
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: GlassmorphismCard(
        onPressed: () {
          Get.to(
            GroupChatDetailsPage(
              convoID: groupConversationController
                  .conversations.value!.groups![index].grpConvId
                  .toString(),
              groupName: groupConversationController
                  .conversations.value!.groups![index].name
                  .toString(),
            ),
          );
        },
        boxHeight: 65.h,
        horizontalPadding: 15.w,
        verticalPadding: 10.h,
        child: chatInfo(index: index),
      ),
    );
  }

  Widget chatInfo({required int index}) {
    GroupConversationController groupConversationController =
        Get.put(GroupConversationController());
    return Obx(
      () {
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
                    title: groupConversationController
                        .conversations.value!.groups![index].name
                        .toString(),
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
                title: groupConversationController
                    .conversations.value!.groups![index].recentMessage
                    .toString(),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget chatDate({required int index}) {
    GroupConversationController groupConversationController =
        Get.put(GroupConversationController());
    return Obx(
      () {
        return TextStyles.customText(
          title: groupConversationController
              .conversations.value!.groups![index].recentMessageTime
              .toString(),
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
        );
      },
    );
  }
}
