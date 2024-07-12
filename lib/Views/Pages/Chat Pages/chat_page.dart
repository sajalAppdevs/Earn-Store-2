import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Chat%20Page%20Widgets/chat_page_body.dart';
import 'package:earn_store/Views/Widgets/Chat%20Page%20Widgets/chat_page_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: PaddedScreen(
        padding: 15.w,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const ChatPageTop(),
            SizedBox(height: 20.h),
            const ChatPageBody(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
