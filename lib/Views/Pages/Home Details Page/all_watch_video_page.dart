import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/all_watch_video_box.dart';
import 'package:flutter/material.dart';

class AllWatchVideoPage extends StatelessWidget {
  const AllWatchVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          CustomTop(title: "Watch Video"),
          AllWatchVideoBox(),
        ],
      ),
    );
  }
}
