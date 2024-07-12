import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/feed_boxes.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/feed_page_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const FeedPageTop(),
          const FeedBoxes(),
          SizedBox(height: 40.h)
        ],
      ),
    );
  }
}
