import 'package:earn_store/Controllers/Social%20Media%20Controllers/social_media_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/feed_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  SocialMediaController controller = Get.put(SocialMediaController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getSocialMedia();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.socialMediaLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    // const FeedPageTop(),
                    const FeedBoxes(),
                    SizedBox(height: 40.h)
                  ],
                ),
              );
      },
    );
  }
}
