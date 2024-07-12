import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsPaperPage extends StatelessWidget {
  const NewsPaperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
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
    return PaddedScreen(
      child: GridView.builder(
        itemCount: 10,
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
            child: Image.asset(
              "${Paths.iconPath}paper.png",
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
