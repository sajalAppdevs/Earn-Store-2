import 'package:earn_store/Controllers/Social%20Media%20Controllers/conversation_controller.dart';
import 'package:earn_store/Controllers/Social%20Media%20Controllers/group_conversation_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Chat%20Page%20Widgets/solo_chat_body.dart';
import 'package:earn_store/Views/Widgets/Chat%20Page%20Widgets/chat_page_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ConversationController conversationController =
      Get.put(ConversationController());
  GroupConversationController groupConversationController =
      Get.put(GroupConversationController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await conversationController.getAllConversation();
    // await groupConversationController.getGroupConversation();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return conversationController.conversationLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: PaddedScreen(
                  padding: 15.w,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const ChatPageTop(),
                      SizedBox(height: 20.h),
                      conversationController.isSoloConvo.value
                          ? const SoloChatBody()
                          : Container(),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
