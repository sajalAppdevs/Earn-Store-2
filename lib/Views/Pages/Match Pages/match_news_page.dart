import 'package:earn_store/Controllers/Home%20Controllers/sport_news_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Match%20List%20Widget/sport_news_box.dart';
import 'package:earn_store/Views/Widgets/Match%20List%20Widget/sport_news_first_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchNewsPage extends StatefulWidget {
  const MatchNewsPage({super.key});

  @override
  State<MatchNewsPage> createState() => _MatchNewsPageState();
}

class _MatchNewsPageState extends State<MatchNewsPage> {
  SportNewsController controller = Get.put(
    SportNewsController(),
  );
  @override
  void initState() {
    super.initState();
    controller.getSportNews();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.newsLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CustomTop(title: "News"),
                    PaddedScreen(
                      child: ListView.builder(
                        itemCount: controller.newsUpdates.value!.news!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return index == 0
                              ? SportNewsFirstBox(index: index)
                              : SportNewsBox(index: index);
                        },
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
