import 'dart:async';

import 'package:earn_store/Controllers/Social%20Media%20Controllers/group_message_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Pages/Chat%20Pages/group_chat_details_bottom.dart';

import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Chat%20Page%20Widgets/group_chat_details_body.dart';
import 'package:earn_store/Views/Widgets/Chat%20Page%20Widgets/group_chat_details_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GroupChatDetailsPage extends StatefulWidget {
  final String convoID;
  final String groupName;
  const GroupChatDetailsPage({
    super.key,
    required this.convoID,
    required this.groupName,
  });

  @override
  State<GroupChatDetailsPage> createState() => _GroupChatDetailsPageState();
}

class _GroupChatDetailsPageState extends State<GroupChatDetailsPage> {
  GroupMessegeController controller = Get.put(GroupMessegeController());
  Timer? timer;
  @override
  void initState() {
    super.initState();
    getData();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void getData() async {
    await controller.getMessages(convoID: widget.convoID);
  }

  void startTimer() {
    const duration = Duration(seconds: 20);
    timer = Timer.periodic(duration, (timer) async {
      // Call your async function here
      await controller.getMessages(convoID: widget.convoID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.messegeLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: Column(
                  children: [
                    GroupChatDetailsTop(
                      groupName: widget.groupName,
                    ),
                    const GroupChatDetailsBody(),
                    GroupChatDetailsBottom(
                      convoID: widget.convoID,
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              );
      },
    );
  }
}
