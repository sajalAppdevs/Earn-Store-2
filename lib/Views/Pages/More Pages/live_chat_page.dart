import 'dart:async';

import 'package:earn_store/Controllers/Social%20Media%20Controllers/admin_chat_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/live_chat_body.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/live_chat_bottom.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/live_chat_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LiveChatPage extends StatefulWidget {
  final String chatID;
  const LiveChatPage({super.key, required this.chatID});

  @override
  State<LiveChatPage> createState() => _LiveChatPageState();
}

class _LiveChatPageState extends State<LiveChatPage> {
  AdminChatController controller = Get.put(AdminChatController());
  Timer? timer;
  @override
  void initState() {
    super.initState();
    getData();
    startTimer();
  }

  void getData() async {
    await controller.getAdminChats(chatID: widget.chatID);
  }

  void startTimer() {
    const duration = Duration(seconds: 20);
    timer = Timer.periodic(duration, (timer) async {
      // Call your async function here
      await controller.getAdminChats(chatID: widget.chatID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.chatLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: Column(
                  children: [
                    const LiveChatTop(),
                    const LiveChatBody(),
                    const LiveChatBottom(),
                    SizedBox(height: 30.h),
                  ],
                ),
              );
      },
    );
  }
}
