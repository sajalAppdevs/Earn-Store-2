import 'package:earn_store/Controllers/Home%20Controllers/all_youtube_video_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/all_youtube_video_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllYoutubeVideoPage extends StatefulWidget {
  const AllYoutubeVideoPage({super.key});

  @override
  State<AllYoutubeVideoPage> createState() => _AllYoutubeVideoPageState();
}

class _AllYoutubeVideoPageState extends State<AllYoutubeVideoPage> {
  bool isLoading = true;
  AllYoutubeVideoController controller = Get.put(AllYoutubeVideoController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getAllYoutubeVideos();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const ScreenLoading()
        : RootDesign(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                CustomTop(title: "Watch Youtube Video"),
                AllYoutubeVideoBox(),
              ],
            ),
          );
  }
}
