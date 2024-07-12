import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_streaming_page.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeStreamingHub extends StatelessWidget {
  const HomeStreamingHub({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(
          title: "Streaming Hub",
          onPressed: () {
            Get.to(
              const AllStreamingPage(),
            );
          },
        ),
        SizedBox(height: 10.h),
        categories(),
      ],
    );
  }

  Widget categories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
          children: List.generate(
        5,
        (index) => Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: GlassmorphismCard(
            boxHeight: 60.h,
            boxWidth: 120.w,
            child: Image.asset(
              index % 2 == 0
                  ? "${Paths.iconPath}chorki.png"
                  : "${Paths.iconPath}hoichoi.png",
              height: 22.h,
              width: 73.w,
              fit: BoxFit.fill,
            ),
          ),
        ),
      )),
    );
  }
}
