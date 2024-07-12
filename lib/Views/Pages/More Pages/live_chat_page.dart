import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/live_chat_body.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/live_chat_bottom.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/live_chat_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveChatPage extends StatelessWidget {
  const LiveChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: Column(
        children: [
          const LiveChatTop(),
          const LiveChatBody(),
          const LiveChatBottom(),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
