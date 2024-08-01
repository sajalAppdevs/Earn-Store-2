import 'package:earn_store/Controllers/Social%20Media%20Controllers/news_paper_controller.dart';
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

class NewsPaperPage extends StatefulWidget {
  const NewsPaperPage({super.key});

  @override
  State<NewsPaperPage> createState() => _NewsPaperPageState();
}

class _NewsPaperPageState extends State<NewsPaperPage> {
  bool isLoading = true;
  NewsPaperController controller = Get.put(NewsPaperController());

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getNewsPaper();
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
                const CustomTop(title: "Online newsPaper"),
                SizedBox(height: 20.h),
                newsPaperTopBox(),
                SizedBox(height: 20.h),
                newsLinks(),
                SizedBox(height: 20.h),
              ],
            ),
          );
  }

  Widget newsPaperTopBox() {
    return PaddedScreen(
      child: GlassmorphismCard(
        boxHeight: 170.h,
        child: Image.asset(
          "${Paths.iconPath}popular_news_box.png",
          height: 147.h,
          width: 310.w,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget newsLinks() {
    return Obx(
      () {
        return PaddedScreen(
          child: GridView.builder(
            itemCount: controller.newsPapers.value!.newspaper!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h,
              childAspectRatio: 1 / 0.8,
            ),
            itemBuilder: (context, index) {
              return GlassmorphismCard(
                onPressed: () {
                  UrlHelpers.openUrl(
                    controller.newsPapers.value!.newspaper![index].link
                        .toString(),
                  );
                },
                child: NetworkImageWidget(
                  imageUrl: controller.newsPapers.value!.newspaper![index].image
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
