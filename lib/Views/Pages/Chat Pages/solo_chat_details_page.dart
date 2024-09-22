import 'dart:async';

import 'package:earn_store/Controllers/Social%20Media%20Controllers/solo_messege_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Pages/Chat%20Pages/solo_chat_details_bottom.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Chat%20Page%20Widgets/solo_chat_details_body.dart';
import 'package:earn_store/Views/Widgets/Chat%20Page%20Widgets/solo_chat_details_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SoloChatDetailsPage extends StatefulWidget {
  final String convoID;
  final String othersID;
  const SoloChatDetailsPage(
      {super.key, required this.convoID, required this.othersID});

  @override
  State<SoloChatDetailsPage> createState() => _SoloChatDetailsPageState();
}

class _SoloChatDetailsPageState extends State<SoloChatDetailsPage> {
  SoloMessegeController controller = Get.put(SoloMessegeController());
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
                    const SoloChatDetailsTop(),
                    const SoloChatDetailsBody(),
                    SoloChatDetailsBottom(
                      convoID: widget.convoID,
                      otherID: widget.othersID,
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              );
      },
    );
  }
}
