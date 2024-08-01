import 'package:earn_store/Controllers/Social%20Media%20Controllers/live_tv_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Utils/url_helpers.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LiveTVPage extends StatefulWidget {
  const LiveTVPage({super.key});

  @override
  State<LiveTVPage> createState() => _LiveTVPageState();
}

class _LiveTVPageState extends State<LiveTVPage> {
  bool isLoading = true;
  LiveTVController controller = Get.put(
    LiveTVController(),
  );

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getOnlineTV();
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
              children: [
                const CustomTop(title: "Live TV Channels"),
                SizedBox(height: 20.h),
                breakingNewsBox(),
                SizedBox(height: 20.h),
                liveTVBox(),
                SizedBox(height: 20.h),
              ],
            ),
          );
  }

  Widget breakingNewsBox() {
    return PaddedScreen(
      child: GlassmorphismCard(
        boxHeight: 170.h,
        child: Image.asset(
          "${Paths.iconPath}breaking_news.png",
          height: 147.h,
          width: 310.w,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget liveTVBox() {
    return Obx(
      () {
        return PaddedScreen(
          child: GridView.builder(
            itemCount: controller.liveTvs.value!.onlineTV!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h,
              childAspectRatio: 1 / 0.75,
            ),
            itemBuilder: (context, index) {
              return GlassmorphismCard(
                onPressed: () {
                  UrlHelpers.openUrl(
                    controller.liveTvs.value!.onlineTV![index].link.toString(),
                  );
                },
                child: NetworkImageWidget(
                  imageUrl: controller.liveTvs.value!.onlineTV![index].image
                      .toString(),
                  height: 80.h,
                  width: 130.w,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
