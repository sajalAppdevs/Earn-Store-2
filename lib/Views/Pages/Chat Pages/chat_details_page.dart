import 'package:earn_store/Views/Pages/Chat%20Pages/chat_details_bottom.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Chat%20Page%20Widgets/chat_details_body.dart';
import 'package:earn_store/Views/Widgets/Chat%20Page%20Widgets/chat_details_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatDetailsPage extends StatelessWidget {
  const ChatDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: Column(
        children: [
          const ChatDetailsTop(),
          const ChatDetailsBody(),
          const ChatDetailsBottom(),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
