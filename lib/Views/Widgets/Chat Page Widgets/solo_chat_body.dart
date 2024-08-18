import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Social%20Media%20Controllers/conversation_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Chat%20Pages/solo_chat_details_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SoloChatBody extends StatelessWidget {
  const SoloChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    ConversationController conversationController =
        Get.put(ConversationController());
    return Obx(
      () {
        return ListView.builder(
          itemCount: conversationController.conversations.value!.member!.length,
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
    ConversationController conversationController =
        Get.put(ConversationController());
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: GlassmorphismCard(
        onPressed: () {
          Get.to(
            SoloChatDetailsPage(
              convoID: conversationController
                  .conversations.value!.member![index].id
                  .toString(),
            ),
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
    ConversationController conversationController =
        Get.put(ConversationController());
    String imagePath = conversationController.imageSelector(index: index);
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder: (context, imageProvider) => Container(
        height: 41.h,
        width: 41.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => ButtonLoading(
        loadingSize: 15.sp,
      ),
      errorWidget: (context, url, error) => Container(
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
      ),
    );
  }

  Widget chatInfo({required int index}) {
    ConversationController conversationController =
        Get.put(ConversationController());
    String name = conversationController.nameSelector(index: index);
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
                  width: 140.w,
                  child: TextStyles.customText(
                    title: name,
                    fontSize: 14.sp,
                    textAlign: TextAlign.left,
                  ),
                ),
                chatDate(index: index)
              ],
            ),
            SizedBox(
              width: 240.w,
              child: TextStyles.customText(
                title: conversationController
                    .conversations.value!.member![index].recentMessage
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
    ConversationController conversationController =
        Get.put(ConversationController());
    return Obx(
      () {
        return TextStyles.customText(
          title: conversationController
              .conversations.value!.member![index].recentMessageTime
              .toString(),
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
        );
      },
    );
  }
}
