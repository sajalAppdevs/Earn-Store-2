import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveTVPage extends StatelessWidget {
  const LiveTVPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
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
    return PaddedScreen(
      child: GridView.builder(
        itemCount: 10,
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
            child: Image.asset(
              "${Paths.iconPath}desh_tv.png",
              height: 80.h,
              width: 130.w,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
